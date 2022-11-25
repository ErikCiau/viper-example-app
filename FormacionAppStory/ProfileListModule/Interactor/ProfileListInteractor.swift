//
//  ProfileListInteractor.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 23/11/22.
//

import Foundation

class ProfileListInteractor: ProfileListInteractorInputProtocol {
    var presenter: ProfileListInteractorOutputProtocol?
    var dataManager: ProfileListManagerProtocol?

    func loadProfiles() {
        dataManager?.loadProfiles(completion: { result in
            switch result {
            case let .success(profiles):
                DispatchQueue.main.async {
                    self.presenter?.didLoadProfiles(profiles)
                }
            case let .failure(error):
                print(error)
            }
        })
    }
}
