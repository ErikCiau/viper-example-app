//
//  ProfileCreatorPresenter.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 25/11/22.
//

import Foundation

class ProfileCreatorPresenter: ProfileCreatorPresenterProtocol {
    var view: ProfileCreatorViewProtocol?
    var interactor: ProfileCreatorInteractorInputProtocol?
    var router: ProfileCreatorRouterProtocol?

    func viewDidLoad() {
    }

    func createProfile(_ profile: ProfileEntity) {
        interactor?.createProfile(profile)
    }
}

extension ProfileCreatorPresenter: ProfileCreatorInteractorOutputProtocol {
    func didCreateProfile() {
        view?.onCreatedProfile()
    }
}
