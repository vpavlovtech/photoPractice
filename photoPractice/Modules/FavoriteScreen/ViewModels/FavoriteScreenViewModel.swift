//
//  FavoriteScreenViewModel.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

final class FavoriteScreenViewModel {
    private var selectedIndexPath: IndexPath?
    private var photos: AllPhotos = UserDefaultsWorker.shared.getPhotos() {
        didSet {
            count.value = photos.count
        }
    }
    private var count = Dynamic(value: 0)
}

extension FavoriteScreenViewModel: FavoriteScreenViewModelProtocol {
    var numberOfCell: Dynamic<Int> {
        return count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> FavoriteCellViewModelProtocol? {
        let photo = photos[indexPath.row]
        return FavoriteCellViewModel(photo: photo)
    }
    
    func selectedRow(at indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> AdvancedInfoProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        let photo = photos[selectedIndexPath.row]
        return AdvancedInfoViewModel(photo: photo)
    }
    func removePhoto(at: IndexPath) {
        let photo = photos[at.row]
        UserDefaultsWorker.shared.removePhoto(photo: photo)
        photos.remove(at: at.row)
    }
    func refreshPhotos() {
        photos = UserDefaultsWorker.shared.getPhotos()
        count.value = photos.count
    }
}

