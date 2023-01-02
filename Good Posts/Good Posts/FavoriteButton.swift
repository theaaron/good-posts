//
//  FavoriteButton.swift
//  Good Posts
//
//  Created by aaron on 1/2/23.
//

import UIKit

class FavoriteButton: UIButton {
    
    let heartSymbol = UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold, scale: .large))
    
    let filledHeartSymbol = UIImage(systemName: "heart.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25, weight: .semibold, scale: .large))

    override init(frame: CGRect) {
        super.init(frame: frame)
        configButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillHeart() {
        setImage(filledHeartSymbol, for: .normal)
    }

    
    func configButton() {
        setImage(heartSymbol, for: .normal)
    }
    
    
}
