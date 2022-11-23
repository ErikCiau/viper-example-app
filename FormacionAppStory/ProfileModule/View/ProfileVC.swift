//
//  ProfileVC.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 18/11/22.
//

import UIKit

class ProfileVC: UIViewController {
    var presenter: ProfilePresenterProtocol?
    private var profile: ProfileEntity?

    @IBOutlet var profileNameLabel: UILabel!
    @IBOutlet var fatherLastNameLabel: UILabel!
    @IBOutlet var motherLastNameLabel: UILabel!
    @IBOutlet var curpLabel: UILabel!
    @IBOutlet var rfcLabel: UILabel!
    @IBOutlet var curriculumLinkLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    private lazy var topButtonRefresh: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonAction))
        button.tintColor = .orange
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupView()
    }

    private func setupView() {
        title = "My Profile"
        let navigationBar = navigationController?.navigationBar
        navigationBar?.isTranslucent = true
        navigationBar?.prefersLargeTitles = true
        navigationBar?.topItem?.setRightBarButton(topButtonRefresh, animated: true)

        // initial values for labels
        profileNameLabel.text = ""
        fatherLastNameLabel.text = ""
        motherLastNameLabel.text = ""
        curpLabel.text = ""
        rfcLabel.text = ""
        curriculumLinkLabel.text = ""
        stateLabel.text = ""
    }

    @objc private func refreshButtonAction() {
        presenter?.loadBuildProfile()
    }
}

extension ProfileVC: ProfileViewProtocol {
    func showProfile(_ profile: ProfileEntity) {
        profileNameLabel.text = "\(profile.primerNombre) \(profile.segundoNombre)"
        fatherLastNameLabel.text = profile.apellidoPaterno
        motherLastNameLabel.text = profile.apellidoMaterno
        curpLabel.text = profile.curp
        rfcLabel.text = profile.rfc
        curriculumLinkLabel.text = profile.linkCurriculum
        stateLabel.text = profile.activo ? "Activo" : "Inactivo"
    }
}
