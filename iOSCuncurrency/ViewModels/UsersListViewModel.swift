//
//  UsersListViewModel.swift
//  iOSCuncurrency
//
//  Created by Fred Javalera on 1/8/22.
//

import Foundation

class UsersListViewModel: ObservableObject {
  @Published var users: [User] = []
  
  func fetchUsers() {
    let apiService = APIService(urlString: "https://jsonplaceholder.typicode.com/users")
    apiService.getJSON { (result: Result<[User], APIError>) in
      switch result {
      case .success(let users):
        DispatchQueue.main.async {
          self.users = users
        }
      case .failure(let error):
        print(error)
      }
    }
  }
}

extension UsersListViewModel {
  convenience init(forPreview: Bool = false) {
    self.init()
    if forPreview {
      self.users = User.mockUsers
    }
  }
}
