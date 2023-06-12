//
//  MainTabBarController.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {

    // -MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupTabBarAppearance()
    }
    // -MARK: Private setupUI
    private func setupViewControllers() {
        viewControllers = TabBarConfigure.allCases.map { tab in
            let viewController = tab.viewController
            viewController.tabBarItem.title = tab.title
            viewController.tabBarItem.selectedImage = tab.selectedImage
            viewController.tabBarItem.image = tab.unselectedImage
            return viewController
        }
    }

    private func setupTabBarAppearance() {
        tabBar.tintColor = .selectedItem
        tabBar.unselectedItemTintColor = .unselectedItem
    }
    
    

}
