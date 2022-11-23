//
//  ProfilePresenter.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 18/11/22.
//

import Foundation

class ProfilePresenter: ProfilePresenterProtocol {
    var view: ProfileViewProtocol?
    var interactor: ProfileInteractorInputProtocol?
    var router: ProfileRouterProtocol?

    func viewDidLoad() {
        interactor?.loadProfile()
    }

    func loadBuildProfile() {
        interactor?.buildProfile()
    }
}

extension ProfilePresenter: ProfileInteractorOutputProtocol {
    func didLoadProfile(_ profile: ProfileEntity) {
        view?.showProfile(profile)
    }

    func didLoadBuildProfile(_ profile: ProfileEntity) {
        /* aqui me surgio una duda,
          el interactor output se suponque que
          se ejecuta en ciertos eventos sobre algo realizado
          para luego actualizar la vista pero,
          ¿es correcto que lanze acciones?
          en caso de que no sea correcto:
          ** debe cambiarse igual parte del interactor **
         func didLoadBuildProfile(profile) {
            view?.showProfile(profile)
         }
         */
        // interactor?.loadProfile() // lanzando accion ¿deberia? 🤔
        view?.showProfile(profile)
    }
}
