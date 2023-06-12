//
//  PhotoCellViewModel.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

final class PhotoCellViewModel {
    private let photo: PhotoModel
    init(photo: PhotoModel) {
        self.photo = photo
    }
}

extension PhotoCellViewModel: PhotoCellViewModelProtocol {
    var photoURL: URL? {
        return URL(string: photo.urls?.small ?? "")
    }
}
