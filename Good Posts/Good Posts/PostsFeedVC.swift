//
//  PostsFeedVC.swift
//  Good Posts
//
//  Created by aaron on 12/23/22.
//

import UIKit

class PostsFeedVC: UIViewController {
    let postsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(postsTableView)
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        postsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        postsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        postsTableView.backgroundColor = .systemGray6
        
    }


}
