//
//  UserDefaultManager.swift
//  Good Posts
//
//  Created by aaron on 1/8/23.
//

import Foundation

enum ActionType {
    case add, remove
}

enum UserDefaultManager {
    static private let defaults = UserDefaults.standard
    
    static let favoritesKey = "favs"
    
    static func updateFavorites(favorite: Post, actionType: ActionType) {
        var currentFavs = getFavorites()
        
        switch actionType {
        case .add:
            if !currentFavs.contains(where: { post in
                post.id == favorite.id
            }) {
                currentFavs.append(favorite)
            }
        case .remove:
            currentFavs.removeAll { $0.id == favorite.id }
        }
        
        save(favorites: currentFavs)
    }
    
    static func getFavorites() -> [Post] {
        guard let favoritesData = defaults.object(forKey: favoritesKey) as? Data else {
            print("error")
            return [Post]()
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Post].self, from: favoritesData)
            return favorites
        } catch {
            print("unable to parse.")
        }
        return [Post]()
    }
    
    static func save(favorites: [Post]) {
        do {
            let encoder = JSONEncoder()
            let encodedPosts = try encoder.encode(favorites)
            defaults.setValue(encodedPosts, forKey: favoritesKey)
            return
        } catch {
            return
        }
    }
    
}
