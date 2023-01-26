//
//  InputView.swift
//  HeyPhotogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import SwiftUI

struct InputView: View {
    
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
                
            } label: {
                Text("Open Image Folder")
            }
            .padding(.top)
        }
        .padding(.all, 20)
    }
    
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
