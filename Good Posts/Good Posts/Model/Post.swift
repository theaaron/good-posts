//
//  Posts.swift
//  Good Posts
//
//  Created by aaron on 12/26/22.
//

import Foundation

struct Post: Codable {
    let id: Int
    let title: String
    let body: String
    let userId: Int
    let tags: [String]
    let reactions: Int
}

