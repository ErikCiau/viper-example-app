//
//  ProfileDetailInteractor.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 19/11/22.
//

import Foundation

class ProfileDetailInteractor: ProfileDetailInteractorProtocol {
    var profile: ProfileEntity?
    var presenter: ProfileDetailInteractorOutputProtocol?
    var dataManager: ProfileDetailManagerProtocol?

    func loadProfile() {
        guard let profile = profile else { return }
        presenter?.didShowProfile(profile)
    }

    func updateProfile(_ profile: ProfileEntity) {
        dataManager?.updateProfile(profile, completion: { _ in
            DispatchQueue.main.async {
                self.presenter?.didUpdatedProfile()
            }
        })
    }

    func deleteProfile(_ profile: ProfileEntity) {
        dataManager?.deleteProfile(profile, completion: { _ in
            DispatchQueue.main.async {
                self.presenter?.didDeleteProfile()
            }

        })
    }
}
