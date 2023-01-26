//
//  InputView.swift
//  HeyPhotogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import SwiftUI

struct InputView: View {
    
    @Binding var appViewState: ApplicationViewState
    @ObservedObject var photogrammetryVM: PhotogrammetryDelegate
    
    @State private var openFolderAlert: Bool = false
    @State private var openFolderAlertInfo: String = String()
    
    var body: some View {
        VStack {
            VStack (spacing: 5) {
                Text("Drag and drop here👋")
                Text("(A folder with 20-60 images is recommend)")
                    .font(.footnote)
            }
            .frame(width: 320, height: 280)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
            Button {
                openFolderAlertInfo = "Error occurred"
                openFolderAlert = true
            } label: {
                Text("Open Image Folder")
            }
            .padding(.top)
        }
        .padding(.all, 20)
        alert(openFolderAlertInfo, isPresented: $openFolderAlert) {
            Button("Okay", role: .cancel) {
                openFolderAlertInfo.removeAll()
            }
        }
    }
    
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(
            appViewState: Binding.constant(ApplicationViewState.onInputView),
            photogrammetryVM: PhotogrammetryDelegate()
        )
    }
}
