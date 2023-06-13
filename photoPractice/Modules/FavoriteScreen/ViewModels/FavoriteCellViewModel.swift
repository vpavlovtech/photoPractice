//
//  FavoriteCellViewModel.swift
//  photoPractice
//
//  Created by VPDev on 13.06.2023.
//

import Foundation

final class FavoriteCellViewModel {
    private let photo: PhotoModel
    init(photo: PhotoModel) {
        self.photo = photo
    }
}

extension FavoriteCellViewModel: FavoriteCellViewModelProtocol {
    var photoURL: URL? {
        return URL(string: photo.urls?.small ?? "")
    }
    var userName: String {
        return photo.user?.username ?? ""
    }
}
