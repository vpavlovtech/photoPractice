//
//  AdvancedInfoViewModel.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

final class AdvancedInfoViewModel {
    private let photo: PhotoModel
    
    init(photo: PhotoModel) {
        self.photo = photo
    }
}

extension AdvancedInfoViewModel: AdvancedInfoProtocol {
    var photoURL: URL? {
        return URL(string: photo.urls?.regular ?? "")
    }
    
    var author: String {
        return photo.user?.username ?? ""
    }
    
    var date: String {
        return photo.createdAt?.dateToString() ?? ""
    }
    
    var location: String {
        return photo.location?.name ?? ""
    }
    
    var countDownload: String {
        return "\(photo.downloads ?? 0)"
    }
    func savePhoto() {
        UserDefaultsWorker.shared.savePhoto(photo: photo)
    }
    func removePhoto() {
        UserDefaultsWorker.shared.removePhoto(photo: photo)
    }
    
    
}
