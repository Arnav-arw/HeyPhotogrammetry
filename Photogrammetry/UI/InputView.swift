//
//  InputView.swift
//  Photogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import SwiftUI

struct InputView: View {
    
    @Binding var applicationViewState: ApplicationViewState
    @ObservedObject var photogrammetryDelegate: PhotogrammetryDelegate
    
    @State private var openFolderAlert: Bool = false
    @State private var openFolderAlertInfo: String = String()
    
    var body: some View {
        VStack() {
            VStack (spacing: 5) {
                Text("Drag and drop here👋")
                Text("(A folder with 20-60 images is recommend)")
                    .font(.footnote)
            }
            .frame(width: 320, height: 280)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            .onDrop(of: ["public.file-url"], delegate: onDrop())
            
            Button {
                photogrammetryDelegate.openInputFolderPanel { (result) in
                    if case let .success(folderUrl) = result {
                        photogrammetryDelegate.inputFolderUrl = folderUrl
                        applicationViewState = .onConfigurationView
                    } else if case let .failure(error) = result {
                        openFolderAlertInfo = error.localizedDescription
                        openFolderAlert = true
                    }
                }
            } label: {
                Text("Open Image Folder")
            }
            .padding(.top)
        }
        .padding(.all, 20)
        .alert(openFolderAlertInfo, isPresented: $openFolderAlert) {
            Button(LocalizedStringKey("input.button.ok"), role: .cancel) {
                openFolderAlertInfo.removeAll()
            }
        }
    }
    
    private func onDrop() -> DropDelegate {
        return OnDropDelegate(
            applicationViewState: $applicationViewState,
            photogrammetryDelegate: photogrammetryDelegate)
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(
            applicationViewState: Binding.constant(ApplicationViewState.onInputView),
            photogrammetryDelegate: PhotogrammetryDelegate())
    }
}
