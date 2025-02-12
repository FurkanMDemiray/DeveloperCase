//
//  DetailViewModel.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import Foundation

// MARK: - Protocols
protocol DetailViewModelProtocol {
    // Weak delegate to prevent retain cycles
    var delegate: DetailViewModelDelegate? { get set }
    // Expose user as read-only
    var getUser: User? { get }
}

protocol DetailViewModelDelegate: AnyObject { }

// MARK: - DetailViewModel
final class DetailViewModel {
    // Using weak delegate to avoid retain cycles
    weak var delegate: DetailViewModelDelegate?
    // Private user property for encapsulation
    private var user: User?

    // Dependency injection through init
    init(user: User) {
        self.user = user
    }
}

// MARK: - DetailViewModelProtocol Implementation
extension DetailViewModel: DetailViewModelProtocol {
    // Read-only access to user data
    var getUser: User? { user }
}



