//
//  URL.swift
//  Photogrammetry
//
//  Created by Arnav Singhal on 26/01/23.
//

import Foundation
import AppKit

extension URL {
    var isDirectory: Bool? {
        do {
            return try resourceValues(forKeys: [URLResourceKey.isDirectoryKey]).isDirectory
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
