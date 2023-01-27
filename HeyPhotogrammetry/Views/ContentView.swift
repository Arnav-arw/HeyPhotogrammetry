//
//  ContentView.swift
//  HeyPhotogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @State var appState = ApplicationViewState.onInputView
    @StateObject var photogrammetryVM = PhotogrammetryDelegate()
    
    var body: some View {
        ZStack {
            switch appState {
            case .onInputView:
                InputView(
                    appViewState: $appState,
                    photogrammetryVM: photogrammetryVM
                )
            case .onSettingsView:
                SettingsView(
                    appViewState: $appState,
                    photogrammetryVM: photogrammetryVM
                )
            case .onProcessingView:
                ProcessingView(
                    applicationViewState: $appState,
                    photogrammetryDelegate: photogrammetryVM
                )
//            case .onExportView:
            default:
                InputView(
                    appViewState: $appState,
                    photogrammetryVM: photogrammetryVM
                )
            }
        }
        .animation(.spring(), value: appState)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
