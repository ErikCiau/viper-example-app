//
//  ProfileListPresenter.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 23/11/22.
//

import Foundation

class ProfileListPresenter: ProfileListPresenterProtocol {
    var view: ProfileListViewProtocol?
    var interactor: ProfileListInteractorInputProtocol?
    var router: ProfileListRouterProtocol?

    func viewDidLoad() {
        interactor?.loadProfiles()
    }

    func showProfileForm() {
        guard let view = view else { return }
        router?.showProfileForm(view)
    }

    func showProfileDetail(profile: ProfileEntity) {
        guard let view = view else { return }
        router?.showProfileDetailView(view, profile)
    }
}

extension ProfileListPresenter: ProfileListInteractorOutputProtocol {
    func didLoadProfiles(_ profiles: [ProfileEntity]) {
        view?.showProfiles(profiles)
    }
}
