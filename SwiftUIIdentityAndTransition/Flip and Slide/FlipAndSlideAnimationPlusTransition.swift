//
//  FlipAndSlideView.swift
//  SwiftUIPlayground
//
//  Created by Raheel Ahmad on 5/9/22.
//

import SwiftUI

struct CardViewWithAnimation: View {
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
        ZStack {
            sideView(side: .front)
                .rotation3DEffect(.degrees(side == .front ? 0 : 180), axis: (0, 1, 0))
                .opacity(side == .front ? 1 : 0)
            sideView(side: .back)
                .rotation3DEffect(.degrees(side == .back ? 0 : -180), axis: (0, 1, 0))
                .opacity(side == .back ? 1 : 0)
        }
    }
}

struct FlipAndSlideAnimationPlusTransition: View {
    let cards: [Card]
    @State var side: Card.Side = .front
    @State private var index = 0

    var card: Card {
        cards[index]
    }

    var transition: AnyTransition {
        .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
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
            CardViewWithAnimation(card: card, side: side)
                .id(card.id)
                .onTapGesture {
                    if side == .front {
                        withAnimation(animation) {
                            side = .back
                        }
                    }
                }
                .padding()
                .transition(transition)

            VStack {
                if side == .back {
                    Navigation(index: $index, side: $side, count: cards.count)
                }
            }.frame(height: 64)
        }
    }
}

struct FlipAndSlideView_Previews: PreviewProvider {
    static var previews: some View {
        FlipAndSlideAnimationPlusTransition(cards: sampleCards)
    }
}
