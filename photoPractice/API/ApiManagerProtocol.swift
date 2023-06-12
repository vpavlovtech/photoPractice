//
//  ApiManagerProtocol.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

protocol ApiManagerProtocol {
    func getRandomPhoto(completion: @escaping (_ photos: AllPhotos) -> Void)
    func getSearchPhoto(search: String?, completion: @escaping (_ photos: AllPhotos) -> Void)
}
