//
//  MainViewController.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 11.02.2025.
//

import UIKit

final class MainViewController: UIViewController {

    var viewModel: MainViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    @IBOutlet private weak var tableView: UITableView!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureTableView()
        viewModel.fetchUsers()
    }

    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: UserTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getUsers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier, for: indexPath) as! UserTableViewCell
        let user = viewModel.getUsers[indexPath.row]

        let cellViewModel = UserCellViewModel()
        cell.viewModel = cellViewModel // Assign first
        cellViewModel.delegate?.configureCell(with: user) // Then configure

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 
    }

}

extension MainViewController: MainViewModelDelegate {
    func usersFetched() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
