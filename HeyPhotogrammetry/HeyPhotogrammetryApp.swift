//
//  HeyPhotogrammetryApp.swift
//  HeyPhotogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import SwiftUI

@main
struct HeyPhotogrammetryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .fixedSize()
                .onAppear { NSWindow.allowsAutomaticWindowTabbing = false }
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
    }
}
