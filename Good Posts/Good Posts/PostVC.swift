//
//  PostViewController.swift
//  Good Posts
//
//  Created by aaron on 12/27/22.
//

import UIKit

class PostVC: UIViewController {
    var postAuthor: String = ""
    var postTitle: String = ""
    var postBody: String = ""
    
    let postTitleLabel = UILabel()
    let postAuthorLabel = UILabel()
    let postBodyTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(postTitleLabel)
        view.addSubview(postBodyTextView)
        view.addSubview(postAuthorLabel)
        configPostTitle()
        configPostAuthor()
        configPostBody()
        view.backgroundColor = .systemPink
        
        // Do any additional setup after loading the view.
    }
    
    
    func configPostTitle() {
        postTitleLabel.text = postTitle
        postTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configPostAuthor() {
        
    }
    
    func configPostBody() {
        
    }



}
