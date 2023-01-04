//
//  PostViewController.swift
//  Good Posts
//
//  Created by aaron on 12/27/22.
//

import UIKit

class PostVC: UIViewController {
    var postAuthor: Int = 0
    var postTitle: String = ""
    var postBody: String = ""
    var posts: [Post] = []
    let favButton = FavoriteButton()
    var postId: Int = 0
    
    let postTitleLabel = UILabel()
    let postAuthorLabel = UILabel()
    let postBodyLabel = UILabel()
    
    var favsArray: [Int] = []
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configPostTitle()
        configPostAuthor()
        configPostBody()
        configFavsButton()
        view.backgroundColor = .systemGray6
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func configPostTitle() {
        view.addSubview(postTitleLabel)
        postTitleLabel.text = postTitle
        postTitleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        postTitleLabel.numberOfLines = 0
        postTitleLabel.adjustsFontSizeToFitWidth = true
        
        postTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        postTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        postTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15.0).isActive = true
        postTitleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15.0).isActive = true
    }
    
    func configPostAuthor() {
        view.addSubview(postAuthorLabel)
    }
    
    func configPostBody() {
        view.addSubview(postBodyLabel)
        postBodyLabel.text = postBody
        postBodyLabel.translatesAutoresizingMaskIntoConstraints = false
        postBodyLabel.numberOfLines = 0
        postBodyLabel.topAnchor.constraint(equalTo: postTitleLabel.bottomAnchor, constant: 30.0).isActive = true
        postBodyLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15.0).isActive = true
        postBodyLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15.0).isActive = true
        
        
    }
    
    func configFavsButton() {
        view.addSubview(favButton)
        if Helpers.favorites.contains(postId) {
            favButton.fillHeart()
            print("fav'd")
        }
        favButton.addTarget(self, action: #selector(favButtonClicked), for: .touchUpInside)
        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.topAnchor.constraint(equalTo: postBodyLabel.bottomAnchor, constant: 20).isActive = true
        favButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    }
    
    @objc func favButtonClicked() {
        
        if favButton.currentImage == favButton.unfilledHeartSymbol {
            favButton.fillHeart()
            Helpers.favorites.append(postId)
            print(Helpers.favorites)
            
        } else {
            favButton.unfillHeart()
            let index = Helpers.favorites.firstIndex(of: postId)
            Helpers.favorites.remove(at: index!)
            print(Helpers.favorites)
        }
    }


}
