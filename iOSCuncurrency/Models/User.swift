//
//  User.swift
//  iOSCuncurrency
//
//  Created by Fred Javalera on 1/8/22.
//

import Foundation

// Source: https://jsonplaceholder.typicode.com/users

struct User: Codable, Identifiable {
  let id: Int
  let name: String
  let username: String
  let email: String
}
