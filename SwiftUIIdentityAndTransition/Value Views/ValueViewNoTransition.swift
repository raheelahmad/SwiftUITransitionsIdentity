//
//  ValueViewNoTransition.swift
//  SwiftUIIdentityAndTransition
//
//  Created by Raheel Ahmad on 5/14/22.
//

import SwiftUI

struct ValueViewNoTransition: View {
    @State private var value = 0

    private var transition: AnyTransition {
        .move(edge: .leading).animation(.easeInOut(duration: 2))
    }

    var body: some View {
        ValueView(value: value)
            .transition(transition)

        Button {
            withAnimation { value += 1 }
        } label: {
            Text("Increment")
        }
    }
}

struct ValueViewNoTransition_Previews: PreviewProvider {
    static var previews: some View {
        ValueViewNoTransition()
    }
}
