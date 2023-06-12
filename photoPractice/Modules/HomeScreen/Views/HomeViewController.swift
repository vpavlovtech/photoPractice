//
//  ViewController.swift
//  photoPractice
//
//  Created by VPDev on 11.06.2023.
//

import UIKit
private enum LocalConstants {
    static let searchPlaceHolder = "Введите запрос"
}
final class HomeViewController: UIViewController {
    private var photoCollectionView: UICollectionView!
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = LocalConstants.searchPlaceHolder
        searchController.searchBar.delegate = self
        return searchController
    }()
    
    // - MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserInterface()
    }
    
    // MARK: Private setupUI
    private func setupUserInterface() {
        view.backgroundColor = .mainColor
        setupNavigationBar()
        setupCollectionView()
    }
    // MARK: Private setup NavigationBar
    private func setupNavigationBar() {
        navigationItem.title = "Random photos"
        navigationItem.searchController = searchController
    }
    // MARK: Private setup collectionView
    private func setupCollectionView() {
        photoCollectionView = .init(frame: .zero, collectionViewLayout: setupflowLayout())
        view.addSubview(photoCollectionView)
        photoCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photoCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        photoCollectionView.showsHorizontalScrollIndicator = false
        photoCollectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.cellIdentifier)
        
    }
    private func setupflowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.itemSize = .init(width: view.frame.width / 2 - 10, height: 300)
        return layout
    }
}
    // - MARK: Extensions
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.cellIdentifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        cell.configureCell()
        return cell
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        searchController.searchBar.resignFirstResponder()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}
