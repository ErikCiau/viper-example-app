//
//  ProfileCreatorInteractor.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 25/11/22.
//

import Foundation

class ProfileCreatorInteractor: ProfileCreatorInteractorInputProtocol {
    var presenter: ProfileCreatorInteractorOutputProtocol?
    var dataManager: ProfileCreatorDataManagerProtocol?

    func createProfile(_ profile: ProfileEntity) {
        dataManager?.registerProfile(profile, completion: { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.presenter?.didCreateProfile()
                }
            case let .failure(error):
                print(error)
            }
        })
    }
}
