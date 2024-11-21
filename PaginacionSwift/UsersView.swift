//
//  UsersView.swift
//  PaginacionSwift
//
//  Created by epismac on 17/10/24.
//

import SwiftUI

struct UsersView: View {
    @StateObject var usersVM = UsersViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(usersVM.users, id: \.self) { user in
                        UserView(user: user)
                            .onAppear {
                                usersVM.loadMoreContentIfNeeded(currentUser: user)
                            }
                    }
                }
            }
            .navigationTitle("Users")
        }
        .onAppear {
            usersVM.fetchUsers()
        }
    }
}
