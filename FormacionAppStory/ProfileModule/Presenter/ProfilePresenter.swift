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
    
    func selectedDetail() {
        router?.pushDetailScreen(from: view!)
    }
}

extension ProfilePresenter: ProfileInteractorOutputProtocol {
    
}
