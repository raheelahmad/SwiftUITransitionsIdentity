import SwiftUI

public struct FlipModifier: ViewModifier {
    public var angle: Double

    public init(angle: Double) {
        self.angle = angle
    }

    public func body(content: Content) -> some View {
        content.rotation3DEffect(.degrees(angle), axis: (0, 1, 0))
    }
}

public extension AnyTransition {
    static func flip(direction: Double) -> AnyTransition {
        AnyTransition.modifier(
            active: FlipModifier(angle: direction * 180),
            identity: FlipModifier(angle: 0)
        )
    }
}

