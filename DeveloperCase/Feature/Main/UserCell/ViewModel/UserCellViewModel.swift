//
//  UserCellViewModel.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import Foundation

protocol UserCellViewModelProtocol {
    var delegate: UserCellViewModelDelegate? { get set }
    var getUser: User? { get }
}

protocol UserCellViewModelDelegate: AnyObject {
    func configureCell(with user: User)
}

final class UserCellViewModel {

    weak var delegate: UserCellViewModelDelegate?
    private var user: User?

    func configure(with user: User) {
        self.user = user
        delegate?.configureCell(with: user)
    }

}

extension UserCellViewModel: UserCellViewModelProtocol {
    var getUser: User? { user }
}
