//
//  MainViewController.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 11.02.2025.
//

import UIKit

final class MainViewController: UIViewController {

    // Injected ViewModel following MVVM pattern
    var viewModel: MainViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    // MARK: - UI Elements
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        configureTableView()
        viewModel.fetchUsers()
    }

    // MARK: - Private Methods
    private func configureTableView() {
        // Configure tableView with custom cell and styling
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: UserTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: UserTableViewCell.identifier)
    }
}

// MARK: - TableView Delegate & DataSource
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
        let user = viewModel.getUsers[indexPath.row]

        let viewController = DetailViewController()
        let detailViewModel = DetailViewModel(user: user)
        viewController.viewModel = detailViewModel

        navigationController?.pushViewController(viewController, animated: true)
    }

}

// MARK: - ViewModel Delegate
extension MainViewController: MainViewModelDelegate {
    // Update UI on main thread when data is fetched
    func usersFetched() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
