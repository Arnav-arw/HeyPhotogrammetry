//
//  ARContainerView.swift
//  HeyPhotogrammetry
//
//  Created by Arnav Singhal on 27/01/23.
//

import SwiftUI
import RealityKit

struct ARContainerView: NSViewRepresentable {
    public typealias NSViewType = ARView
    public var arContainerViewDelegate: ARContainerViewDelegate
    
    public func makeNSView(context: Context) -> ARView { return arContainerViewDelegate as ARView }
    
    public func updateNSView(_ nsView: ARView, context: Context) { }
}
