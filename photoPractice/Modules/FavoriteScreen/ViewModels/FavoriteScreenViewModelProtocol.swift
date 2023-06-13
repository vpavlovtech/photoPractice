//
//  FavoriteScreenViewModelProtocol.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

protocol FavoriteScreenViewModelProtocol {
    var numberOfCell: Dynamic<Int> { get }
    func cellViewModel(for indexPath: IndexPath) -> FavoriteCellViewModelProtocol?
    func selectedRow(at indexPath: IndexPath)
    func viewModelForSelectedRow() -> AdvancedInfoProtocol?
    func removePhoto(at: IndexPath)
    func refreshPhotos()
}
