//
//  ContentView.swift
//  HeyPhotogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var appState = AppViewState.onInputView
    @StateObject var photogrammetryVM = PhotogrammetryViewModel()
    
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
//            case .onProcessingView:
//                <#code#>
//            case .onExportView:
//                <#code#>
            default:
                InputView(
                    appViewState: $appState,
                    photogrammetryVM: photogrammetryVM
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
