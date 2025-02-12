//
//  DetailViewModel.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import Foundation

protocol DetailViewModelProtocol {
    var delegate: DetailViewModelDelegate? { get set }
    var getUser: User? { get }
}

protocol DetailViewModelDelegate: AnyObject {
    func configureView(with user: User)
}

final class DetailViewModel {

    weak var delegate: DetailViewModelDelegate?
    private var user: User?

    func configure(with user: User) {
        self.user = user
        delegate?.configureView(with: user)
    }
}

extension DetailViewModel: DetailViewModelProtocol {
    var getUser: User? { user }
}



