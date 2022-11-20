//
//  ProfileVC.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 18/11/22.
//

import UIKit

class ProfileVC: UIViewController {
    var presenter: ProfilePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sopa de caracol"
    }

    @IBAction func toDetail(_ sender: Any) {
        presenter?.selectedDetail()
    }
}

extension ProfileVC: ProfileViewProtocol {
}
