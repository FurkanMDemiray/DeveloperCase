//
//  DetailViewController.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import UIKit

final class DetailViewController: UIViewController {

    var viewModel: DetailViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()


    }




}

extension DetailViewController: DetailViewModelDelegate {
    func configureView(with user: User) {
        //
    }
}
