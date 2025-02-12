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
    var users: [User] { get }
    func fetchUsers()
}

final class MainViewModel {

    weak var delegate: MainViewModelDelegate?
    

}

extension MainViewModel: MainViewModelProtocol {
    var users: [User] {
        return []
    }
    
    func fetchUsers() {

    }
    

}

