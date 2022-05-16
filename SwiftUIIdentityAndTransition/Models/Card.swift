import SwiftUI

struct Card: Identifiable {
    enum Side: String {
        var id: String {
            rawValue
        }

        var other: Self {
            switch self {
            case .front:
                return .back
            case .back:
                return .front
            }
        }

        var text: String {
            switch self {
            case .front:
                return "Question"
            case .back:
                return "Answer"
            }
        }

        case front, back

        var background: Color {
            switch self {
            case .front:
                return Color(red: 171 / 255.0, green: 189 / 255.0, blue: 211 / 255.0)
            case .back:
                return Color(red: 196 / 255.0, green: 123 / 255.0, blue: 99 / 255.0)
            }
        }

        var foreground: Color {
            switch self {
            case .front:
                return Color.black
            case .back:
                return Color.white
            }
        }
    }

    let id: String
    let front: String
    let back: String

    func text(side: Side) -> String {
        switch side {
        case .front:
            return front
        case .back:
            return back
        }
    }
}

let sampleCards: [Card] = [
    Card(
        id: UUID().uuidString,
        front: """
        Which best describes how a recession develops as demand and production decrease?

        a.)The recession accelerates.

        b.) The recession spirals out of control

        c.)The recession feeds on itself.

        d.) The recession starts and stops.
        """, back: """
        Demand greatly decreases.
        """
    ),
    Card(
        id: UUID().uuidString,
        front: """
        In which layer of Earth's interior does convection occur?
        crust
        mantle
        outer core
        inner core
        """, back: """
        mantle
        """
    ),
    Card(
        id: UUID().uuidString,
        front: """
        Foods labeled "fat free" can actually contain less than 0.5 grams of fat.

        True or False?
        """, back: """
        True
        """
    ),
]
