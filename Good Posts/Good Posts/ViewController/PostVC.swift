//
//  PostViewController.swift
//  Good Posts
//
//  Created by aaron on 12/27/22.
//

import UIKit

class PostVC: UIViewController {
    var post: Post!
    var postAuthor: Int = 0
    var postTitle: String = ""
    var postBody: String = ""
    var posts: [Post] = []
    let favButton = FavoriteButton()
    var postId: Int = 0
    
    let postTitleLabel = UILabel()
    let postAuthorLabel = UILabel()
    let postBodyLabel = UILabel()
    
    var favsArray: [Post] = UserDefaultManager.getFavorites()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configPostTitle()
        configPostBody()
        configFavsButton()
        configPostAuthor()
        view.backgroundColor = .systemGray6
    }
    
    // Checks favorites to see if post favorite status has changed.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configFavsOnReappear()
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
        if favsArray.contains(where: { postInArr in
            postInArr.id == post.id
        }) {
            favButton.fillHeart()
        }
        
        favButton.addTarget(self, action: #selector(favButtonClicked), for: .touchUpInside)
        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.topAnchor.constraint(equalTo: postBodyLabel.bottomAnchor, constant: 20).isActive = true
        favButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        favButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func configPostAuthor() {
        view.addSubview(postAuthorLabel)
        postAuthorLabel.translatesAutoresizingMaskIntoConstraints = false
        postAuthorLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        postAuthorLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        postAuthorLabel.topAnchor.constraint(equalTo: postBodyLabel.bottomAnchor, constant: 22).isActive = true
        PostsNetworkingManager.shared.getUserById(userId: String(postAuthor)) { user, errorMessage in
            guard let user = user else {
                print(errorMessage ?? "error")
                return
            }
            DispatchQueue.main.async {
                self.postAuthorLabel.text = "-\(user.username)"
            }
        }
    }
    
    
    // Checks favorites array to verify that the favorite status of the post has not changed.
    func configFavsOnReappear() {
        favsArray = UserDefaultManager.getFavorites()
        if favsArray.contains(where: { $0.id == post.id }) {
            favButton.fillHeart()
        } else {
            favButton.unfillHeart()
        }
    }
    
    // Adds post to favorites, or removes from favorites if already fav'd.
    @objc func favButtonClicked() {
        
        if favButton.currentImage == favButton.unfilledHeartSymbol {
            favButton.fillHeart()
            UserDefaultManager.updateFavorites(favorite: post, actionType: .add)
        } else {
            favButton.unfillHeart()
            UserDefaultManager.updateFavorites(favorite: post, actionType: .remove)
        }
    }


}
