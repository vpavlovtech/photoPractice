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
    private let homeViewModel: HomeViewModelProtocol = HomeViewModel()
    
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
        bindViewModel()
    }
    
    // - MARK: Private setupUI
    private func setupUserInterface() {
        view.backgroundColor = .mainColor
        setupNavigationBar()
        setupCollectionView()
    }
    // - MARK: Private setup NavigationBar
    private func setupNavigationBar() {
        navigationItem.title = "Random photos"
        navigationItem.searchController = searchController
    }
    // - MARK: Private setup collectionView
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
//        layout.minimumLineSpacing = 5
//        layout.minimumInteritemSpacing = 5
        layout.itemSize = .init(width: view.bounds.width / 2 - 5, height: 200)
        return layout
    }
    // - MARK: Bind viewModel
    
    private func bindViewModel() {
        homeViewModel.getPhotos()
        homeViewModel.numberOfCell.bind { value in
            self.photoCollectionView.reloadData()
        }
    }
}
    // - MARK: Extensions
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.numberOfCell.value
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.cellIdentifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        let cellViewModel = homeViewModel.cellViewModel(for: indexPath)
        switch cellViewModel {
        case let castViewModel as PhotoCellViewModel:
            cell.configureCell(viewModel: castViewModel)
        default: return cell
        }
        return cell
    }

}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeViewModel.selectedRow(at: indexPath)
        guard let viewModel = homeViewModel.viewModelForSelectedRow() else { return }
        let viewController = AdvancedInfoViewController(advancedViewModel: viewModel)
        viewController.modalPresentationStyle = .automatic
        self.present(viewController, animated: true)
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        searchController.searchBar.resignFirstResponder()
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        homeViewModel.searchPhotos(search: searchBar.text)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        homeViewModel.lookCachPhotos()
    }
}
