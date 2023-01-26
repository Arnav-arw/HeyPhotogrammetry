//
//  PhotogrammetryViewModel.swift
//  HeyPhotogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import Foundation
import RealityKit
import AppKit

class PhotogrammetryViewModel: ObservableObject {
    
    @Published var sessionRequestDetail: PhotogrammetrySession.Request.Detail = PhotogrammetrySession.Request.Detail()
    @Published var sessionConfiguration: PhotogrammetrySession.Configuration = PhotogrammetrySession.Configuration()
    @Published var sessionProgress: Double = 0
    @Published var sessionInfo: String = String()
    
}
