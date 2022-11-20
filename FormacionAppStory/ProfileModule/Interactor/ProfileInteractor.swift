//
//  ProfileInteractor.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 18/11/22.
//

import Foundation

class ProfileInteractor: ProfileInteractorInputProtocol {
    var presenter: ProfileInteractorOutputProtocol?
    var localManager: ProfileDataManager?
}
