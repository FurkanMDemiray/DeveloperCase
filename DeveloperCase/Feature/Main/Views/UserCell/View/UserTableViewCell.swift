//
//  UserTableViewCell.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import UIKit

final class UserTableViewCell: UITableViewCell {

    var viewModel: UserCellViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    static let identifier = "UserTableViewCell"

    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var mailLabel: UILabel!
    @IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureContainerView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    private func configureContainerView(){
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 5
    }

}

extension UserTableViewCell: UserCellViewModelDelegate {

    func configureCell(with user: User) {
        print("configure cell")
        userNameLabel.text = user.name
        mailLabel.text = user.email
    }
}

