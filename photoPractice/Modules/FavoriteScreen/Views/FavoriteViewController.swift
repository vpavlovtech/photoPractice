//
//  FavoriteViewController.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import UIKit

final class FavoriteViewController: UIViewController {
    private let favoriteTableView = UITableView(frame: .zero, style: .plain)
    
    // - MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserInterface()
    }
    
    // MARK: Private setupUI
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

}

// - MARK: Extension

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteTableViewCell.cellIdentifier, for: indexPath) as? FavoriteTableViewCell else { return UITableViewCell() }
        cell.configureCell()
        return cell
    }
    
    
}

extension FavoriteViewController: UITableViewDelegate {
    
}
