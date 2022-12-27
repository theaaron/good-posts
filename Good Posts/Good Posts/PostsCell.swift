//
//  PostsCell.swift
//  Good Posts
//
//  Created by aaron on 12/26/22.
//

import UIKit

class PostsCell: UITableViewCell {
    
    var postTitle = UILabel()
    var postAuthor = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .systemGray6
        addSubview(postTitle)
        addSubview(postAuthor)
        configPostTitle()
        configPostAuthor()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(post: Posts) {
        postTitle.text = post.postTitle
        postAuthor.text = post.postAuthor
    }
    
    func configPostTitle() {
        
        postTitle.translatesAutoresizingMaskIntoConstraints = false
        postTitle.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        postTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18).isActive = true
        postTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18).isActive = true
        postTitle.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    func configPostAuthor() {
        postAuthor.translatesAutoresizingMaskIntoConstraints = false
        postAuthor.numberOfLines = 0
        postAuthor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18).isActive = true
        postAuthor.bottomAnchor.constraint(equalTo: postTitle.bottomAnchor, constant: 18).isActive = true
    }
    
    
}
