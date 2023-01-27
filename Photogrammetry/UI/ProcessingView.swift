//
//  ProcessingView.swift
//  Photogrammetry
//
//  Created by Arnav Singhal on 27/01/23.
//

import SwiftUI

struct ProcessingView: View {
    @Binding var applicationViewState: ApplicationViewState
    @ObservedObject var photogrammetryDelegate: PhotogrammetryDelegate
    
    @State private var photogrammetryAlert: Bool = false
    @State private var photogrammetryAlertInfo: String = String()
    @State private var animation: Bool = false
    
    var body: some View {
        VStack (spacing: 15) {
            Spacer()
            Image(systemName: "gear.circle.fill")
                .font(.system(size: 100))
                .frame(width: 320)
                .fixedSize()
                .foregroundColor(Color.secondary.opacity(0.6))
                .shadow(radius: 3)
                .rotationEffect(Angle(degrees: animation ? 360 : 0))
                .onAppear {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: false)) {
                        animation.toggle()
                    }
                }
            
            ProgressView(value: photogrammetryDelegate.sessionProgress, total: 1.0)
                .frame(width: 320)
                .fixedSize()
                .padding([.trailing, .leading], 15)
            
            Text(photogrammetryDelegate.sessionInfo)
                .lineLimit(2)
                .frame(width: 320)
                .fixedSize(horizontal: true, vertical: true)
                .padding([.trailing, .leading], 15)
            Spacer()
        }
        .onAppear {
            photogrammetryDelegate.generateModel { (result) in
                if case let .success(modelUrl) = result {
                    photogrammetryDelegate.outputModelUrl = modelUrl
                    applicationViewState = ApplicationViewState.onExportView
                } else if case let .failure(error) = result {
                    photogrammetryAlertInfo = error.localizedDescription
                    photogrammetryAlert = true
                }
            }
        }
        .onDisappear { photogrammetryAlertInfo.removeAll() }
        .alert(photogrammetryAlertInfo, isPresented: $photogrammetryAlert) {
            Button("Cancel", role: .cancel) {
                photogrammetryDelegate.cancelGeneratingModel()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { self.applicationViewState = .onConfigurationView }
            }
        }
    }
}

struct ProcessingView_Previews: PreviewProvider {
    static var previews: some View {
        ProcessingView(applicationViewState: Binding.constant(ApplicationViewState.onProcessingView),
                       photogrammetryDelegate: PhotogrammetryDelegate())
    }
}
