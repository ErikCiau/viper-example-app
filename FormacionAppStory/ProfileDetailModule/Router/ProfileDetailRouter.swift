//
//  ProfileDetailRouter.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 19/11/22.
//

import Foundation
import UIKit

class ProfileDetailRouter: ProfileDetailRouterProtocol {
    static private var screenView: UIStoryboard = {
        UIStoryboard(name: "ProfileDetail", bundle: nil)
    }()

    static func createModule() -> UIViewController {
        let view = self.screenView.instantiateViewController(withIdentifier: "ProfileDetailVC") as! ProfileDetailVC
        let presenter: ProfileDetailPresenterProtocol & ProfileDetailInteractorOutputProtocol = ProfileDetailPresenter()
        let interactor:ProfileDetailInteractor = ProfileDetailInteractor()
        let router: ProfileDetailRouterProtocol = ProfileDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
