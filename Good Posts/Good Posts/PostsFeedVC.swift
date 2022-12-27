//
//  PostsFeedVC.swift
//  Good Posts
//
//  Created by aaron on 12/23/22.
//

import UIKit

class PostsFeedVC: UIViewController {
    
    var posts: [Posts] = [Posts(postTitle: "asdf asdf asdf asdf", postBody: "asdf asdf asdf", postAuthor: "Sana"),
                          Posts(postTitle: "asdf", postBody: "asdf asdf asdf", postAuthor: "Momo"),
                          Posts(postTitle: "asdf", postBody: "asdf asdf asdf", postAuthor: "G-Dragon"),
                          Posts(postTitle: "asdf asdf asdf asdf", postBody: "asdf asdf asdf", postAuthor: "T.O.P."),
                          Posts(postTitle: "asdf", postBody: "asdf asdf asdf", postAuthor: "Jisoo"),
                          Posts(postTitle: "asdf", postBody: "asdf asdf asdf", postAuthor: "Lalisa"),
                          Posts(postTitle: "asdf asdf asdf asdf", postBody: "asdf asdf asdf", postAuthor: "Rosé"),
                          Posts(postTitle: "asdf", postBody: "asdf asdf asdf", postAuthor: "Sakura"),
                          Posts(postTitle: "asdf", postBody: "asdf asdf asdf", postAuthor: "Chae Won")]
    
    struct Cells {
        static let postsCell = "PostsCell"
    }
    
    let postsTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    
    func setupTableView() {
        view.addSubview(postsTableView)
        
        //set delegates
        setPostsTableViewDelegates()
        //set row height
        postsTableView.rowHeight = 150
        //register cells
        postsTableView.register(PostsCell.self, forCellReuseIdentifier: Cells.postsCell)
        //set constraints
        
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        postsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        postsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        postsTableView.backgroundColor = .systemGray6
        
        
    }

    
    func setPostsTableViewDelegates() {
        postsTableView.delegate = self
        postsTableView.dataSource = self
    }

}

extension PostsFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: Cells.postsCell) as! PostsCell
        let post = posts[indexPath.row]
        cell.set(post: post)
        
        return cell
    }
    
    
}
