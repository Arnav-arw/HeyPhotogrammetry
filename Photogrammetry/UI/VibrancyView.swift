//
//  VibrancyView.swift
//  Photogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import SwiftUI

struct VibrancyView: NSViewRepresentable {
    func makeNSView(context: Self.Context) -> NSView {
        let visualEffectView = NSVisualEffectView()
        visualEffectView.blendingMode = .behindWindow
        visualEffectView.material = .fullScreenUI
        visualEffectView.state = .active
        return visualEffectView
    }
    
    func updateNSView(_ nsView: NSView, context: Context) { }
}
