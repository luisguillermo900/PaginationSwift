//
//  UsersViewModel.swift
//  PaginacionSwift
//
//  Created by epismac on 17/10/24.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    private var currentPage = 1
    private var canLoadMorePages = true
    private var isLoading = false

    func fetchUsers() {
        guard !isLoading else { return }
        
        isLoading = true
        let apiUrl = "https://randomuser.me/api/?page=\(currentPage)&results=5"

        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self?.isLoading = false
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(UserResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.users.append(contentsOf: response.results)
                    
                    self?.canLoadMorePages = response.results.count == 5
                    self?.isLoading = false
                }
            } catch {
                DispatchQueue.main.async {
                    self?.isLoading = false
                }
            }
        }.resume()
    }
    
    func loadMoreContentIfNeeded(currentUser user: User) {
        guard canLoadMorePages, !isLoading, let lastUser = users.last else {
            return
        }
        
        if user == lastUser {
            fetchUsers()
        }
    }
}
