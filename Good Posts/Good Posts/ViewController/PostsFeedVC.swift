//
//  PostsFeedVC.swift
//  Good Posts
//
//  Created by aaron on 12/23/22.
//

import UIKit

class PostsFeedVC: UIViewController {
    
    var users: [User] = []
    var favsArray: [Post] = UserDefaultManager.getFavorites()
    
    
    let postsTableView = UITableView()

    var posts: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllPosts()
        setupTableView()
    }
    
    // setting delegates, size of cell, registering cells and adding constraints.
    func setupTableView() {
        view.addSubview(postsTableView)
        
        setPostsTableViewDelegates()
        postsTableView.rowHeight = 130
        postsTableView.register(PostsCell.self, forCellReuseIdentifier: PostsCell.reuseId)
        
        //set constraints
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        postsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        postsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        postsTableView.backgroundColor = .systemGray6
    }
    //network call to get all posts.
    func getAllPosts() {
        PostsNetworkingManager.shared.getAllPosts { postsDict, errorMessage in
            guard let postsDict = postsDict else {
                print("error")
                return
            }
            self.posts.append(contentsOf: postsDict.posts)
            
            DispatchQueue.main.async{
              self.postsTableView.reloadData()
            }
        }
        
    }
    
    func setPostsTableViewDelegates() {
        postsTableView.delegate = self
        postsTableView.dataSource = self
    }
    

}

// extension to conform to protocols. keeps this bit separated from the rest of the VC.
extension PostsFeedVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: PostsCell.reuseId) as! PostsCell
        let post = posts[indexPath.row]
        cell.set(post: post)

        return cell
    }

    //for navigation, sends us to the PostVC when tapping a post.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let destVC = PostVC()
        destVC.favsArray = UserDefaultManager.getFavorites()
        destVC.postTitle = post.title
        destVC.postAuthor = post.userId
        destVC.postBody = post.body
        destVC.posts = posts
        destVC.postId = post.id
        destVC.favsArray = favsArray
        destVC.post = post

        navigationController?.pushViewController(destVC, animated: true)
    }


}
