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
    
    let postTitleLabel = UILabel()
    let postAuthorLabel = UILabel()
    let postBodyLabel = UILabel()
    
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
        favButton.translatesAutoresizingMaskIntoConstraints = false
        favButton.topAnchor.constraint(equalTo: postBodyLabel.bottomAnchor, constant: 20).isActive = true
        favButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    }
    
    @objc func favsButtonClicked() {
        favButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }


}
