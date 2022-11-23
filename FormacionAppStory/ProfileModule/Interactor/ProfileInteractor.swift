//
//  ProfileInteractor.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 18/11/22.
//

import Foundation

class ProfileInteractor: ProfileInteractorInputProtocol {
    var presenter: ProfileInteractorOutputProtocol?
    var dataManager: ProfileDataManagerProtocol?

    func loadProfile() {
        dataManager?.getUserProfile(completion: { result in
            switch result {
            case let .success(profile):
                DispatchQueue.main.async {
                    self.presenter?.didLoadProfile(profile)
                }
            case let .failure(error):
                fatalError(error.description)
            }
        })
    }

    func buildProfile() {
        dataManager?.createUserProfile(completion: { result in
            switch result {
            case let .success(profile):
                DispatchQueue.main.async {
                    self.presenter?.didLoadBuildProfile(profile)
                }
            case let .failure(error):
                fatalError(error.description)
            }

        })
    }
}
