//
//  FavoriteScreenViewModel.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

final class FavoriteScreenViewModel {
    private var selectedIndexPath: IndexPath?
    private var count = Dynamic(value: 0)
    private var photos: AllPhotos = UserDefaultsWorker.shared.getPhotos() {
        didSet {
            print("COUNt = \(photos.count)")
            count.value = photos.count
        }
    }
    private func getPhotos() -> AllPhotos {
        var savedPhotos: AllPhotos = []
        if let savedPhoto = UserDefaults.standard.object(forKey: "photos") as? Data {
            do {
                let photo = try JSONDecoder().decode(PhotoModel.self, from: savedPhoto)
                savedPhotos.append(photo)
            }
            catch {
                print("Error, parsing saved photo")
            }
        }
        return savedPhotos
    }
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
}
