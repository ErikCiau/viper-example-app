//
//  ProfileTableViewCell.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 24/11/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var lastnameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        usernameLabel.text = ""
        lastnameLabel.text = ""
    }

    func setData(_ username: String, _ lastname: String) {
        usernameLabel.text = username
        lastnameLabel.text = lastname
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
