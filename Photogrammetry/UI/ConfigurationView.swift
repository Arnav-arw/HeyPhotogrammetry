//
//  ConfigurationView.swift
//  Photogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import SwiftUI
import RealityKit

struct ConfigurationView: View {
    @Binding var applicationViewState: ApplicationViewState
    @ObservedObject var photogrammetryDelegate: PhotogrammetryDelegate
    
    var body: some View {
        VStack (alignment: .center, spacing: 15) {
            VStack (alignment: .leading, spacing: 5) {
                Picker("Model Detail", selection: $photogrammetryDelegate.sessionRequestDetail) {
                    ForEach(PhotogrammetrySession.Request.Detail.allCases, id: \.self) {
                        Text($0).tag(PhotogrammetrySession.Request.Detail.init($0))
                    }
                }
                .pickerStyle(.menu)
                .padding(.all, 15)
            }
            .frame(width: 320)
            .fixedSize()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            
            VStack (alignment: .leading, spacing: 5) {
                HStack {
                    Text("Object Masking")
                    Spacer()
                    Toggle("Object Masking", isOn: $photogrammetryDelegate.sessionConfiguration.isObjectMaskingEnabled)
                        .toggleStyle(.switch)
                        .labelsHidden()
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                
                Picker("Feature Sensitivity", selection: $photogrammetryDelegate.sessionConfiguration.featureSensitivity) {
                    ForEach(PhotogrammetrySession.Configuration.FeatureSensitivity.allCases, id: \.self) {
                        Text($0).tag(PhotogrammetrySession.Configuration.FeatureSensitivity.init($0))
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
                
                Picker("Sample Ordering", selection: $photogrammetryDelegate.sessionConfiguration.sampleOrdering) {
                    ForEach(PhotogrammetrySession.Configuration.SampleOrdering.allCases, id: \.self) {
                        Text($0).tag(PhotogrammetrySession.Configuration.SampleOrdering.init($0))
                    }
                }
                .padding(.horizontal, 15)
                .padding(.vertical, 10)
            }
            .pickerStyle(.segmented)
            .frame(width: 320)
            .fixedSize()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            
            HStack {
                Button("Back") { applicationViewState = ApplicationViewState.onInputView }
                    .keyboardShortcut(.leftArrow, modifiers: .command)
                
                Spacer()
                
                Button("Generate") { applicationViewState = ApplicationViewState.onProcessingView }
                    .keyboardShortcut("g", modifiers: .command)
            }
            .frame(width: 320)
            .fixedSize()
        }
        .padding(.all, 20)
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigurationView(
            applicationViewState: Binding.constant(ApplicationViewState.onConfigurationView),
            photogrammetryDelegate: PhotogrammetryDelegate())
    }
}
