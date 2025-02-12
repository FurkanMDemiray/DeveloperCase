//
//  UserTableViewCell.swift
//  DeveloperCase
//
//  Created by Melik Demiray on 12.02.2025.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    var viewModel: UserCellViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UserTableViewCell: UserCellViewModelDelegate {
    func userFetched() {
        // update UI
    }
}
