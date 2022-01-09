//
//  PostsListViewModel.swift
//  iOSCuncurrency
//
//  Created by Fred Javalera on 1/8/22.
//

import Foundation

class PostsListViewModel: ObservableObject {
  @Published var posts: [Post] = []
  var userId: Int?
  
  func fetchPosts() {
    if
      let userId = userId {
      let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users/\(userId)/posts")
      apiService.getJSON { (result: Result<[Post], APIError>) in
        switch result {
        case .success(let posts):
          DispatchQueue.main.async {
            self.posts = posts
          }
        case .failure(let error):
          print(error)
        }
      }
    }
  }
}
