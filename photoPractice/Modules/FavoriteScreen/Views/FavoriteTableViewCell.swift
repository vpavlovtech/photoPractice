//
//  FavoriteTableViewCell.swift
//  photoPractice
//
//  Created by VPDev on 12.06.2023.
//

import UIKit
private enum LocalConstant {
    static let labelFont: CGFloat = 15
}
final class FavoriteTableViewCell: UITableViewCell {
    static let cellIdentifier = "FavoriteTableViewCell"
    
    private let miniPhoto: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: LocalConstant.labelFont)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    // - MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }
    // - MARK: Private method setupCell
    private func setupCell() {
        [miniPhoto, authorLabel].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            miniPhoto.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2.5),
            miniPhoto.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2.5),
            miniPhoto.widthAnchor.constraint(equalToConstant: 100),
            miniPhoto.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2.5),

            authorLabel.centerYAnchor.constraint(equalTo: miniPhoto.centerYAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: miniPhoto.trailingAnchor, constant: 10),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2.5),
        ])
    }
    // - MARK: Public method configureCell
    func configureCell() {
        miniPhoto.image = UIImage(named: "DC")
        authorLabel.text = "test developer"
    }
}
