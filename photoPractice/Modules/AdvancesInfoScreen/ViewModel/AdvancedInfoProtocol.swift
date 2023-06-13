//
//  AdvanedInfoProtocol.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

protocol AdvancedInfoProtocol {
    var photoURL: URL? { get }
    var author: String { get }
    var date: String { get }
    var location: String { get }
    var countDownload: String { get }
    func savePhoto()
    func removePhoto()
}

