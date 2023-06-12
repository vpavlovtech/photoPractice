//
//  PhotoCollectionViewCell.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import UIKit
import Kingfisher

final class PhotoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "PhotoCollectionViewCell"
    private let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // - MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // - MARK: Private method setupCell
    private func setupCell() {
        contentView.addSubview(mainImageView)
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2.5),
            mainImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2.5),
            mainImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    // - MARK: Public method configureCell
    func configureCell(viewModel: PhotoCellViewModel) {
        mainImageView.kf.setImage(with: viewModel.photoURL,
                                  options: [.cacheOriginalImage,
                                            .transition(.fade(0.25))])
    }
}
