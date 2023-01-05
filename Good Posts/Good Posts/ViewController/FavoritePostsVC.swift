//
//  FavoritePostsVC.swift
//  Good Posts
//
//  Created by aaron on 12/23/22.
//

import UIKit

class FavoritePostsVC: UIViewController {

    var allPosts: [Post] = []
    var favPosts: [Post] = []
    
    var favsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFavPosts()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavsOnReappear()
        favsCollectionView.reloadData()
        
    }
    
    
    func setupCollectionView() {
        favsCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: makeTwoColumnFlowLayout())
        setupCollectionViewDelegates()
        view.addSubview(favsCollectionView)
        favsCollectionView.backgroundColor = .systemGray6
        favsCollectionView.register(FavoritesCell.self, forCellWithReuseIdentifier: FavoritesCell.reuseID)
        
    }
    
    func setupCollectionViewDelegates() {
        favsCollectionView.delegate = self
        favsCollectionView.dataSource = self
    }
    
    func makeTwoColumnFlowLayout() -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 20
        let cellSpacing: CGFloat = 20
        let availableWidth = width - (padding * 2) - cellSpacing
        let cellWidth = availableWidth / 2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        flowLayout.minimumLineSpacing = padding
        
        return flowLayout
    }
    
    
    func getFavPosts() {
        favPosts = []
        PostsNetworkingManager.shared.getAllPosts { postsDict, errorMessage in
            guard let postsDict = postsDict else {
                print("error")
                return
            }
            self.allPosts.append(contentsOf: postsDict.posts)
            
            self.favPosts = self.allPosts.filter({Helpers.favorites.contains($0.id)})
            
            DispatchQueue.main.async{
              self.favsCollectionView.reloadData()
            }
        }
        print(favPosts.count)
    }
    
    func getFavsOnReappear() {
        self.favPosts = self.allPosts.filter({Helpers.favorites.contains($0.id)})
        DispatchQueue.main.async{
          self.favsCollectionView.reloadData()
        }
    }
    
    
    
    
    
    
    

}

extension FavoritePostsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favPosts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = favsCollectionView.dequeueReusableCell(withReuseIdentifier: FavoritesCell.reuseID, for: indexPath) as! FavoritesCell
        let favorite = favPosts[indexPath.row]
        cell.set(favorite: favorite)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post = favPosts[indexPath.row]
        let destVC = PostVC()
        destVC.postId = post.id
        destVC.postTitle = post.title
        destVC.postBody = post.body
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(destVC, animated: true)
        
    }
}
