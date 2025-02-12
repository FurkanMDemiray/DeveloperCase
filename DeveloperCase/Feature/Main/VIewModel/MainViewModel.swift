//
//  MainViewModel.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import Foundation

// MARK: - Protocols
protocol MainViewModelDelegate: AnyObject {
    // Called when users are successfully fetched and ready to display
    func usersFetched()
}

protocol MainViewModelProtocol {
    var delegate: MainViewModelDelegate? { get set }
    var getUsers: [User] { get }
    func fetchUsers()
}

// MARK: - MainViewModel
final class MainViewModel {
    // Using weak delegate to avoid retain cycles
    weak var delegate: MainViewModelDelegate?

    // Injecting service for better testability and separation of concerns
    private let userService: UserService
    private var users: [User] = []

    init(userService: UserService = UserService()) {
        self.userService = userService
    }
}

// MARK: - MainViewModelProtocol Implementation
extension MainViewModel: MainViewModelProtocol {
    // Expose users as read-only to maintain encapsulation
    var getUsers: [User] { users }

    func fetchUsers() {
        Task {
            do {
                // remove all users before fetching new ones
                users.removeAll()
                
                // Fetch users from service
                users = try await userService.fetchUsers()
                delegate?.usersFetched()
            } catch {
                print("Error fetching users: \(error)")
            }
        }
    }
}

