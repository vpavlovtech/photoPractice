//
//  AdvancedInfoViewController.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import UIKit
import Kingfisher

final class AdvancedInfoViewController: UIViewController {
    let advancedViewModel: AdvancedInfoProtocol

    init(advancedViewModel: AdvancedInfoProtocol) {
        self.advancedViewModel = advancedViewModel
        super.init(nibName: nil, bundle: nil)
    }
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    private let authorLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let createAt: UILabel = {
        let label = UILabel()
        return label
    }()
    private let locationLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    private let countDownloadLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // - MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUserIntereface()
        updateValues()
    }
    // - MARK: Private setupUI
    private func setupUserIntereface() {
        view.backgroundColor = .mainColor
        [photoImageView, authorLabel, createAt, locationLabel, countDownloadLabel].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            photoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            photoImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            photoImageView.heightAnchor.constraint(equalToConstant: 400),
            
            authorLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20),
            authorLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            
            createAt.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            createAt.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor),
            createAt.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            
            countDownloadLabel.topAnchor.constraint(equalTo: createAt.bottomAnchor, constant: 10),
            countDownloadLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor),
            countDownloadLabel.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: countDownloadLabel.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor)
        ])
    }
    private func updateValues() {
        photoImageView.kf.setImage(with: advancedViewModel.photoURL,
                                  options: [.cacheOriginalImage,
                                            .transition(.fade(0.25))])
        authorLabel.text = "Автор: \(advancedViewModel.author)"
        createAt.text = "Дата публикации: \(advancedViewModel.date)"
        countDownloadLabel.text = "Количество скачиваний: \(advancedViewModel.countDownload)"
        guard !advancedViewModel.location.isEmpty else { return }
        locationLabel.text = "Местоположение: \(advancedViewModel.location)"
    }


}
