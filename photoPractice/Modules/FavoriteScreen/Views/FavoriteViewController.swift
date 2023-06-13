//
//  FavoriteViewController.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import UIKit

final class FavoriteViewController: UIViewController {
    private let favoriteViewModel: FavoriteScreenViewModelProtocol = FavoriteScreenViewModel()
    private let favoriteTableView = UITableView(frame: .zero, style: .plain)
    
    // - MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserInterface()
        bindViewModel()
    }
    
    // - MARK: Private setupUI
    private func setupUserInterface() {
        view.backgroundColor = .mainColor
        setupTableView()
    }
    
    private func setupTableView() {
        favoriteTableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: FavoriteTableViewCell.cellIdentifier)
        favoriteTableView.dataSource = self
        favoriteTableView.delegate = self
        favoriteTableView.rowHeight = 100

        view.addSubview(favoriteTableView)
        favoriteTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            favoriteTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            favoriteTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            favoriteTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    // - MARK: Bind viewModel
    private func bindViewModel() {
        favoriteViewModel.numberOfCell.bind { value in
            print(value)
            self.favoriteTableView.reloadData()
        }
    }
}

// - MARK: Extension

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteViewModel.numberOfCell.value
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.cellIdentifier, for: indexPath) as? FavoriteTableViewCell else { return UITableViewCell() }
        let cellViewModel = favoriteViewModel.cellViewModel(for: indexPath)
        switch cellViewModel {
        case let castViewModel as FavoriteCellViewModel:
            cell.configureCell(viewModel: castViewModel)
        default: return cell
        }
        return cell
    }
    
    
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        favoriteViewModel.selectedRow(at: indexPath)
        guard let viewModel = favoriteViewModel.viewModelForSelectedRow() else { return }
        let viewController = AdvancedInfoViewController(advancedViewModel: viewModel)
        viewController.modalPresentationStyle = .automatic
        self.present(viewController, animated: true)
    }
}
