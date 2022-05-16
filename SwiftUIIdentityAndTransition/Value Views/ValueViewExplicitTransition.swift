import SwiftUI

struct ValueViewExplicitTransition: View {
    @State private var value = 0

    private var transition: AnyTransition {
        .move(edge: .leading).animation(.easeInOut(duration: 2))
    }

    var body: some View {
        ValueView(value: value)
            .id(value)
            .transition(transition)

        Button {
            withAnimation { value += 1 }
        } label: {
            Text("Increment")
        }
    }
}

