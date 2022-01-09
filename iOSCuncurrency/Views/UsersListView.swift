//
//  UsersListView.swift
//  iOSCuncurrency
//
//  Created by Fred Javalera on 1/8/22.
//

import SwiftUI

struct UsersListView: View {
  #warning("Remove the forPreview argument or set it to false before uploading to the App Store!")
  @StateObject var vm = UsersListViewModel(forPreview: true)
    var body: some View {
      NavigationView {
        List {
          ForEach(vm.users) { user in
            VStack(alignment: .leading) {
              Text(user.name)
                .font(.title)
              Text(user.email)
            }
          }
        }
        .navigationTitle("Users")
        .listStyle(.plain)
        .onAppear {
          vm.fetchUsers()
        }
      }
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
