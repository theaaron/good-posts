//
//  FavoritePostsVC.swift
//  Good Posts
//
//  Created by aaron on 12/23/22.
//

import UIKit

class FavoritePostsVC: UIViewController {

    
    var favPosts: [Post] = [Post(id: 3, title: "Yeerah yeah yeah yeasdah yeadfh yeah yeah yeah yeah yeah", body: "yeah yeah yeah", userId: 9, tags: [], reactions: 5), Post(id: 3, title: "Yeah", body: "yeah yeah yeah", userId: 9, tags: [], reactions: 5), Post(id: 3, title: "Yeah", body: "yeah yeah yeah", userId: 9, tags: [], reactions: 5), Post(id: 3, title: "Yeah", body: "yeah yeah yeah", userId: 9, tags: [], reactions: 5), Post(id: 3, title: "Yeah", body: "yeah yeah yeah", userId: 9, tags: [], reactions: 5), Post(id: 3, title: "Yeah", body: "yeah yeah yeah", userId: 9, tags: [], reactions: 5), Post(id: 3, title: "Yeah", body: "yeah yeah yeah", userId: 9, tags: [], reactions: 5), Post(id: 3, title: "Yeah", body: "yeah yeah yeah", userId: 9, tags: [], reactions: 5), Post(id: 3, title: "Yeah", body: "yeah yeah yeah", userId: 9, tags: [], reactions: 5), Post(id: 3, title: "Yeah", body: "yeah yeah yeah", userId: 9, tags: [], reactions: 5)
    ]
    
    
    var favsCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
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
}
