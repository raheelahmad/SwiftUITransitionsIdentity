import SwiftUI

struct Navigation: View {
    @Binding var index: Int
    @Binding var side: Card.Side
    let count: Int

    var animation: Animation {
        .easeInOut(duration: 0.6)
    }

    var body: some View {
        HStack {
            Button {
                withAnimation(animation) {
                    if index > 0 {
                        index -= 1
                        side = .front
                    }
                }
            } label: {
                Image(systemName: "arrow.left.circle")
                    .resizable()
                    .frame(width: 34, height: 34)
            }.disabled(index < 1)

            Spacer()

            Button {
                withAnimation(animation) {
                    if index < count - 1 {
                        index += 1
                        side = .front
                    }
                }
            } label: {
                Image(systemName: "arrow.right.circle")
                    .resizable()
                    .frame(width: 34, height: 34)
            }.disabled(index >= count - 1)
        }.padding()
    }
}

