//
//  ProfileCreatorVC.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 25/11/22.
//

import UIKit

class ProfileCreatorVC: UIViewController {
    var presenter: ProfileCreatorPresenterProtocol?

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var secondNameTextField: UITextField!
    @IBOutlet var fatherNameTextField: UITextField!
    @IBOutlet var motherNameTextField: UITextField!
    @IBOutlet var curpTextField: UITextField!
    @IBOutlet var rfcTextField: UITextField!
    @IBOutlet var curriculumLinkTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    @IBAction func createProfile(_ sender: UIButton) {
        let profile = ProfileEntity(id: Int.random(in: 1 ... 100), primerNombre: firstNameTextField.text ?? "", segundoNombre: secondNameTextField.text ?? "", apellidoPaterno: fatherNameTextField.text ?? "", apellidoMaterno: motherNameTextField.text ?? "", curp: curpTextField.text ?? "", rfc: rfcTextField.text ?? "", linkCurriculum: curriculumLinkTextField.text ?? "", activo: true)
        print(profile)
        presenter?.createProfile(profile)
    }
}

extension ProfileCreatorVC: ProfileCreatorViewProtocol {
    func onCreatedProfile() {
        navigationController?.popViewController(animated: true)
    }
}
