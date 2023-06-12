//
//  enum TabBarConfigure.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import UIKit
private enum LocalConstant {
    static let homeTitle = "Фото"
    static let favoriteTitle = "Избранное"
}
enum TabBarConfigure: CaseIterable {
    case home, favorite
    
    var viewController: UIViewController {
        switch self {
        case .home: return UINavigationController(rootViewController: HomeViewController())
        case .favorite: return FavoriteViewController()
        }
    }
    var title: String {
        switch self {
        case .home: return LocalConstant.homeTitle
        case .favorite: return LocalConstant.favoriteTitle
        }
    }
    var selectedImage: UIImage? {
        switch self {
        case .home: return UIImage(systemName: ImagesNames.homeSelected)
        case .favorite: return UIImage(systemName: ImagesNames.favoriteSelected)
        }
    }
    var unselectedImage: UIImage? {
        switch self {
        case .home: return UIImage(systemName: ImagesNames.homeUnselected)
        case .favorite: return UIImage(systemName: ImagesNames.favoriteUnselected)
        }
    }
}
