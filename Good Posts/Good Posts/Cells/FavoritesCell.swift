//
//  FavoritesCell.swift
//  Good Posts
//
//  Created by aaron on 1/1/23.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    static let reuseID = "FavoritesCell"
    
    let postTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
        backgroundColor = .systemGray3
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favorite: Post) {
        postTitleLabel.text = favorite.title
    }
    
    private func setupLabel() {
        addSubview(postTitleLabel)
        postTitleLabel.numberOfLines = 0
        postTitleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        postTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        postTitleLabel.textAlignment = .center
        postTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        postTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        postTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        postTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        layer.cornerRadius = 10
    }
    
}
