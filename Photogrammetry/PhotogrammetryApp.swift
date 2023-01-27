//
//  PhotogrammetryApp.swift
//  Photogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import SwiftUI

@main
struct PhotogrammetryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(VibrancyView().ignoresSafeArea())
                .fixedSize()
                .onAppear { NSWindow.allowsAutomaticWindowTabbing = false }
                .onReceive(NotificationCenter.default.publisher(for: NSApplication.didBecomeActiveNotification)) { _ in
                    NSApp.mainWindow?.standardWindowButton(.zoomButton)?.isHidden = true
                }
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
    }
}
