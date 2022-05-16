//
//  SwiftUIIdentityAndTransitionApp.swift
//  SwiftUIIdentityAndTransition
//
//  Created by Raheel Ahmad on 5/14/22.
//

import SwiftUI

@main
struct SwiftUIIdentityAndTransitionApp: App {
    private var flipSlideViews: some View {
        Section {
            NavigationLink("Flip and Slide: Animation & Transition") {
                FlipAndSlideAnimationPlusTransition(cards: sampleCards)
                    .navigationTitle("Animation & transition")
            }
            NavigationLink("Flip and Slide: Only Transitions") {
                FlipAndSlideOnlyTransitionsView(cards: sampleCards)
                    .navigationTitle("Only transitions")
            }
        } header: {
            Text("Flip and Slide")
        }
    }
    
    
    private var valueTransitionViews: some View {
        Section {
            NavigationLink("Value View: No transition") {
                ValueViewNoTransition()
                    .navigationTitle("No transitions")
            }
            
            NavigationLink("Value View: Structual Identity transition") {
                ValueViewStructuralTransition()
                    .navigationTitle("Structural Identity transition")
            }
            
            NavigationLink("Value View: Explicit Identity transition") {
                ValueViewExplicitTransition()
                    .navigationTitle("Explicit Identity transition")
            }
        } header: {
            Text("ValueView transitions")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                List {
                    valueTransitionViews
                    
                    flipSlideViews
                }.navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
