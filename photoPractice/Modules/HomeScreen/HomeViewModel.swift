//
//  HomeViewModel.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

final class HomeViewModel {
    private var selectedIndexPath: IndexPath?
    private var count = Dynamic(value: 0)
    private var photos: AllPhotos = [] {
        didSet {
            count.value = photos.count
        }
    }
    private var cachPhotos: AllPhotos = []
}

extension HomeViewModel: HomeViewModelProtocol {
    var numberOfCell: Dynamic<Int> {
        return count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> PhotoCellViewModelProtocol? {
        let photo = photos[indexPath.row]
        return PhotoCellViewModel(photo: photo)
    }
    
    func selectedRow(at indexPath: IndexPath) {
        selectedIndexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> AdvancedInfoProtocol? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        let photo = photos[selectedIndexPath.row]
        return AdvancedInfoViewModel()
    }
    func getPhotos() {
        ApiManager.shared.getRandomPhoto { [weak self] photos in
            DispatchQueue.main.async {
                self?.photos = photos
            }
        }
    }
    func searchPhotos(search: String?) {
        cachPhotos = photos
        guard let text = search else { return }
        ApiManager.shared.getSearchPhoto(search: text) { photos in
            DispatchQueue.main.async {
                self.photos = photos
            }
        }
    }
    func lookCachPhotos() {
        photos = cachPhotos
    }

}
