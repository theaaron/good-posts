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
    
    let postTitleLabel = UILabel()
    let postAuthorLabel = UILabel()
    let postBodyTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configPostTitle()
        configPostAuthor()
        configPostBody()
        view.backgroundColor = .systemBackground
        
        // Do any additional setup after loading the view.
    }
    
    
    func configPostTitle() {
        view.addSubview(postTitleLabel)
        postTitleLabel.text = postTitle
        postTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configPostAuthor() {
        view.addSubview(postAuthorLabel)
    }
    
    func configPostBody() {
        view.addSubview(postBodyTextView)
        postBodyTextView.text = postBody
        
    }


}
