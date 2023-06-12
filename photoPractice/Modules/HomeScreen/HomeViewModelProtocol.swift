//
//  HomeViewModelProtocol.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    var numberOfCell: Dynamic<Int> { get }
    func cellViewModel(for indexPath: IndexPath) -> PhotoCellViewModelProtocol?
    func selectedRow(at indexPath: IndexPath)
    func viewModelForSelectedRow() -> AdvancedInfoProtocol?
    func getPhotos() 
}
