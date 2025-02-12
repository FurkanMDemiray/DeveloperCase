//
//  UserCellViewModel.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import Foundation

protocol UserCellViewModelProtocol {
    var delegate: UserCellViewModelDelegate? { get set }
//    var name: String { get }
//    var username: String { get }
//    var email: String { get }
//    var phone: String { get }
//    var website: String { get }
//    var address: String { get }
//    var company: String { get }
}

protocol UserCellViewModelDelegate: AnyObject {
    func userFetched()
}

final class UserCellViewModel {

    weak var delegate: UserCellViewModelDelegate?

}

extension UserCellViewModel: UserCellViewModelProtocol {

}
