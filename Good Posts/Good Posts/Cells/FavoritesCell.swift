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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favorite: Post) {
        postTitleLabel.text = favorite.title
    }
    
    private func setupLabel() {
        addSubview(postTitleLabel)
        postTitleLabel.backgroundColor = .systemPink
        postTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        postTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        postTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        postTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        postTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        layer.cornerRadius = 10
    }
    
}
