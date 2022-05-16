import SwiftUI

struct ValueViewStructuralTransition: View {
    @State private var value = 0

    private var transition: AnyTransition {
        .move(edge: .leading).animation(.easeInOut(duration: 2))
    }

    var body: some View {
        Group {
            if value > 0 {
                ValueView(value: value)
            } else {
                ValueView(value: value)
            }
        }.transition(transition)

        Button {
            withAnimation { value += 1 }
        } label: {
            Text("Increment")
        }
    }
}

