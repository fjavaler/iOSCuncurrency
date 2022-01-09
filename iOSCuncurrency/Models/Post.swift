//
//  Post.swift
//  iOSCuncurrency
//
//  Created by Fred Javalera on 1/8/22.
//

import Foundation

// Source: https://jsonplaceholder.typicode.com/users/1/posts
/// A single user's post.
struct Post: Codable, Identifiable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}
