//
//  ProfileDetailVC.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 19/11/22.
//

import UIKit

class ProfileDetailVC: UIViewController {
    var presenter: ProfileDetailPresenterProtocol?
    @IBOutlet var firstnameLabel: UILabel!
    @IBOutlet var secondnameLabel: UILabel!
    @IBOutlet var fatherNameLabel: UILabel!
    @IBOutlet var motherNameLabel: UILabel!
    @IBOutlet var curpLabel: UILabel!
    @IBOutlet var rfcLabel: UILabel!
    @IBOutlet var curriculumLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    @IBOutlet var deactivateButton: UIButton!
    @IBOutlet var activateButton: UIButton!
    @IBOutlet var deleteButton: UIButton!

    private var profile: ProfileEntity!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupView()
        setupButtons()
    }

    func setupView() {
        // navbar
        let navbar = navigationController?.navigationBar
        navbar?.prefersLargeTitles = false

        if let profile = profile {
            title = "Perfil de \(profile.primerNombre)"
            // labels
            firstnameLabel.text = profile.primerNombre
            secondnameLabel.text = profile.segundoNombre
            fatherNameLabel.text = profile.apellidoPaterno
            motherNameLabel.text = profile.apellidoMaterno
            curpLabel.text = profile.curp
            rfcLabel.text = profile.rfc
            curriculumLabel.text = profile.linkCurriculum
            stateLabel.text = profile.activo ? "Activo" : "Inactivo"
        } else {
            title = "Perfil"
        }
    }

    func setupButtons() {
        if let profile = profile {
            if profile.activo {
                activateButton.isHidden = true
            } else {
                deactivateButton.isHidden = true
            }
        }
    }

    @IBAction func deactivateAccount(_ sender: Any) {
        presenter?.changeStateProfile(profile)
    }

    @IBAction func activateAccount(_ sender: Any) {
        presenter?.changeStateProfile(profile)
    }

    @IBAction func deleleteAccount(_ sender: Any) {
        presenter?.deleteProfile(profile)
    }
}

extension ProfileDetailVC: ProfileDetailViewProtocol {
    func onDeleteProfile() {
        navigationController?.popViewController(animated: true)
    }

    func onUpdatedProfile() {
        navigationController?.popViewController(animated: true)
    }

    func showProfile(_ profile: ProfileEntity) {
        self.profile = profile
    }
}
