//
//  FileManager-DocumentsDirectory.swift
//  Bucketlist
//
//  Created by Noah Johnson on 4/8/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
