//
//  SettingsView.swift
//  HeyPhotogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import SwiftUI
import RealityKit

struct SettingsView: View {
    
    @Binding var appViewState: ApplicationViewState
    @ObservedObject var photogrammetryVM: PhotogrammetryDelegate
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                Picker("Model Detail", selection: $photogrammetryVM.sessionRequestDetail) {
                    ForEach(PhotogrammetrySession.Request.Detail.allCases, id: \.self) {
                        Text($0)
                            .tag(PhotogrammetrySession.Request.Detail.init($0))
                    }
                }
                .pickerStyle(.menu)
                .padding([.leading, .trailing], 15)
            }
            .frame(width: 320)
            .fixedSize()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                
                Spacer()
                HStack {
                    Text("Object Masking")
                    Spacer()
                    Toggle("Object Masking", isOn: $photogrammetryVM.sessionConfiguration.isObjectMaskingEnabled)
                        .toggleStyle(.switch)
                        .labelsHidden()
                }
                .padding([.leading, .trailing], 15)
                
                Spacer()
                Picker("Feature Sensitivity", selection: $photogrammetryVM.sessionConfiguration.featureSensitivity) {
                    ForEach(PhotogrammetrySession.Configuration.FeatureSensitivity.allCases, id: \.self) {
                        Text($0)
                            .tag(PhotogrammetrySession.Configuration.FeatureSensitivity.init($0))
                    }
                }
                .padding([.leading, .trailing], 15)
                
                Spacer()
                Picker("Sample Ordering", selection: $photogrammetryVM.sessionConfiguration.sampleOrdering) {
                    ForEach(PhotogrammetrySession.Configuration.SampleOrdering.allCases, id: \.self) {
                        Text($0)
                            .tag(PhotogrammetrySession.Configuration.SampleOrdering.init($0))
                    }
                }
                .padding([.leading, .trailing], 15)
            }
            .pickerStyle(.segmented)
            .frame(width: 320)
            .fixedSize()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            
            HStack {
                Button {
                    appViewState = ApplicationViewState.onInputView
                } label: {
                    Text("Back")
                }
                Spacer()
                Button {
                    appViewState = ApplicationViewState.onProcessingView
                } label: {
                    Text("Generate")
                }
            }
            .frame(width: 320)
            .fixedSize()
        }
        .padding(.all, 20)
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(
            appViewState: Binding.constant(ApplicationViewState.onSettingsView),
            photogrammetryVM: PhotogrammetryDelegate()
        )
    }
}
