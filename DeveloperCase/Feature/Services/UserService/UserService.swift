//
//  UserService.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import Foundation

final class UserService {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService(baseURL: Constants.baseURL)) {
        self.networkService = networkService
    }

    func fetchUsers() async throws -> [User] {
        return try await networkService.request(
            Constants.usersPath,
            method: .get,
            parameters: nil,
            headers: nil,
            type: [User].self
        )
    }

//    func fetchUser(id: Int) async throws -> User {
//        return try await networkService.request(
//            "\(Constants.usersPath)/\(id)",
//            method: .get,
//            parameters: nil,
//            headers: nil,
//            type: User.self
//        )
//    }
}
