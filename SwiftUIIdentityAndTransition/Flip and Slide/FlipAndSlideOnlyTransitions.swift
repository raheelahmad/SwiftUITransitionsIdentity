import SwiftUI

struct CardViewWithoutAnimations: View {
    let card: Card
    let side: Card.Side

    func sideView(side: Card.Side) -> some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(side.text.capitalized)
                        .font(.callout.smallCaps().bold())
                        .foregroundColor(side.foreground).opacity(0.6)
                    Spacer()
                }
                .padding(.horizontal, 20)

                Spacer()
            }

            Text(card.text(side: side))
                .font(.title3)
                .foregroundColor(side.foreground).opacity(0.9)
                .lineSpacing(2.4)
                .padding(.horizontal, 20)
        }
        .padding(.vertical)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(side.background)
        )
    }

    var body: some View {
        sideView(side: side)
    }
}

struct FlipAndSlideOnlyTransitionsView: View {
    let cards: [Card]
    @State var side: Card.Side = .front
    @State private var index = 0

    var card: Card {
        cards[index]
    }

    var fullTransition: AnyTransition {
        if side == .front {
            return .asymmetric(
                insertion: .move(edge: .trailing),
                removal: .flip(direction: 1).combined(with: .opacity)
            )
        } else {
            return .asymmetric(
                insertion: .flip(direction: -1).combined(with: .opacity),
                removal: .move(edge: .leading)
            )
        }
    }

    var animation: Animation {
        .easeInOut(duration: 0.8)
    }

    var flip: some View {
        Button {
            withAnimation(animation) {
                side = .back
            }
        } label: {
            Image(systemName: "arrow.triangle.swap")
                .resizable()
                .frame(width: 24, height: 24)
        }
    }

    var body: some View {
        VStack {
            CardViewWithoutAnimations(card: card, side: side)
                .id(card.id + side.id)
                .onTapGesture {
                    if side == .front {
                        withAnimation(animation) {
                            side = .back
                        }
                    }
                }
                .padding()
                .transition(fullTransition)

            VStack {
                if side == .back {
                    Navigation(index: $index, side: $side, count: cards.count)
                }
            }.frame(height: 64)
        }
    }
}
