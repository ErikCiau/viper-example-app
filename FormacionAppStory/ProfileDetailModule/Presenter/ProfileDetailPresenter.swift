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
    
}

extension ProfileDetailPresenter: ProfileDetailInteractorOutputProtocol {
    
}
