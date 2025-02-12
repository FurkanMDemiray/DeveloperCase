//
//  MainViewModel.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import Foundation

protocol MainViewModelDelegate: AnyObject {
    func usersFetched()
}

protocol MainViewModelProtocol {
    var delegate: MainViewModelDelegate? { get set }
    var getUsers: [User] { get }
    func fetchUsers()

}

final class MainViewModel {

    weak var delegate: MainViewModelDelegate?
    private let userService = UserService()
    private var users: [User] = []

}

extension MainViewModel: MainViewModelProtocol {

    var getUsers: [User] { users }

    func fetchUsers() {
        Task {
            do {
                let users = try await userService.fetchUsers()
                users.forEach { user in
                    self.users.append(user)
                }
                delegate?.usersFetched()
            } catch {
                print("Error fetching users: \(error)")
            }
        }
    }

}

