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
        dataManager?.getUserProfile(completion: { profile in
            self.presenter?.didLoadProfile(profile)
        }, failure: { error in
            // anything bussines logic for handle errors
            fatalError("Error to load user")
        })
    }
}
