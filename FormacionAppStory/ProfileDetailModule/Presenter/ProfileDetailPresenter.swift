//
//  ProfileDetailPresenter.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 19/11/22.
//

import Foundation

class ProfileDetailPresenter: ProfileDetailPresenterProtocol {
    
    
    var view: ProfileDetailViewProtocol?
    var interactor: ProfileDetailInteractorProtocol?
    var router: ProfileDetailRouterProtocol?

    func viewDidLoad() {
        interactor?.loadProfile()
    }

    func changeStateProfile(_ profile: ProfileEntity) {
        interactor?.updateProfile(profile)
    }
    
    func deleteProfile(_ profile: ProfileEntity) {
        interactor?.deleteProfile(profile)
    }
}

extension ProfileDetailPresenter: ProfileDetailInteractorOutputProtocol {
    func didDeleteProfile() {
        view?.onDeleteProfile()
    }

    func didShowProfile(_ profile: ProfileEntity) {
        view?.showProfile(profile)
    }

    func didUpdatedProfile() {
        view?.onUpdatedProfile()
    }
}
