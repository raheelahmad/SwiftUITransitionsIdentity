import SwiftUI

struct ValueView: View {
    let value: Int

    var body: some View {
        RoundedRectangle(cornerRadius: 6, style: .continuous)
            .fill(Color.orange)
            .opacity(0.6)
            .frame(width: 100, height: 100)
            .overlay(
                Text("\(value)")
                    .padding()
            )
    }
}
