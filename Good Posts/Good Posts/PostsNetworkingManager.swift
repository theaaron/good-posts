//
//  PostsNetworkingManager.swift
//  Good Posts
//
//  Created by aaron on 12/29/22.
//

import Foundation

struct PostsNetworkingManager {
    static let shared = PostsNetworkingManager()
    
    private init() {}
    
    let postsURL = "https://dummyjson.com/posts"
    let allUsersURL = "https://dummyjson.com/users?limit=100"
    let userURL = "https://dummyjson.com/users/"
    
    
    func getAllPosts(completed: @escaping (PostsDict?, String?) -> Void)  {
      //create url
        guard let url = URL(string: postsURL) else {
            completed(nil, "Unable to retrieve posts.")
            return
        }
        //create task
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Unable to retrieve posts.")
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Unable to retieve posts.")
                return
            }

            guard let data = data else {
                completed(nil, "The data was invalid")
                return
            }


            do {
                let decoder = JSONDecoder()
                let postsDict: PostsDict = try decoder.decode(PostsDict.self, from: data)
                completed(postsDict, nil)
            } catch {
                completed(nil, "it didn't work")
            }
        }
        //start the task
        task.resume()
        
    }
    
    func getUserById(userId: String, completed: @escaping (User?, String?) -> Void)  {
      //create url
        let urlString = userURL + userId
        guard let url = URL(string: urlString) else {
            completed(nil, "Unable to retrieve posts.")
            return
        }
        //create task
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(nil, "Recieved an error.")
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Did not receive 200 response.")
                return
            }

            guard let data = data else {
                completed(nil, "The data was invalid")
                return
            }


            do {
                let decoder = JSONDecoder()
                let user: User = try decoder.decode(User.self, from: data)
                completed(user, nil)
            } catch {
                completed(nil, "it didn't work")
            }
        }
        //start the task
        task.resume()
        
    }
    
    
    
    
    
}
