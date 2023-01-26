//
//  SettingsView.swift
//  HeyPhotogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var AppViewState: AppViewState
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            VStack(alignment: .leading, spacing: 5) {
                Spacer()
                Picker("Model Detail", selection: <#T##Binding<SelectionValue>#>) {
                    ForEach() {
                        Text($0)
                            .tag(<#T##tag: Hashable##Hashable#>)
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(
            AppViewState: Binding.constant(AppViewState.onSettingsView)
        )
    }
}
