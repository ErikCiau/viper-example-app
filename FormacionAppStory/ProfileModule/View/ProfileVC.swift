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
    
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var fatherLastNameLabel: UILabel!
    @IBOutlet weak var motherLastNameLabel: UILabel!
    @IBOutlet weak var curpLabel: UILabel!
    @IBOutlet weak var rfcLabel: UILabel!
    @IBOutlet weak var curriculumLinkLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Profile"
        presenter?.viewDidLoad()
        setupView()
    }

    private func setupView() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.isTranslucent = true
        navigationBar?.prefersLargeTitles = true
        
        setUserData()
    }
    
    private func setUserData(){
        if let profile = self.profile {
            print(profile)
            profileNameLabel.text = "\(profile.primerNombre) \(profile.segundoNombre)"
            fatherLastNameLabel.text = profile.apellidoPaterno
            motherLastNameLabel.text = profile.apellidoMaterno
            curpLabel.text = profile.curp
            rfcLabel.text = profile.rfc
            curriculumLinkLabel.text = profile.linkCurriculum
            stateLabel.text = profile.activo ? "Activo" : "Inactivo"
        }
    }
    
}

extension ProfileVC: ProfileViewProtocol {
    func showProfile(_ profile: ProfileEntity) {
        self.profile = profile
    }
}
