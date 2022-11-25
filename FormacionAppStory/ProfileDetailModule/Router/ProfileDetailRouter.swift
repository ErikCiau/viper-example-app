//
//  ProfileDetailRouter.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 19/11/22.
//

import Foundation
import UIKit

class ProfileDetailRouter: ProfileDetailRouterProtocol {
    private static var screenView: UIStoryboard = {
        UIStoryboard(name: "ProfileDetail", bundle: nil)
    }()

    static func createModule(with profile: ProfileEntity) -> UIViewController {
        let view = screenView.instantiateViewController(withIdentifier: "ProfileDetailVC") as! ProfileDetailVC
        let presenter: ProfileDetailPresenterProtocol & ProfileDetailInteractorOutputProtocol = ProfileDetailPresenter()
        let interactor: ProfileDetailInteractor = ProfileDetailInteractor()
        let router: ProfileDetailRouterProtocol = ProfileDetailRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.profile = profile
        interactor.dataManager = ProfileDetailManagerSQLite.shared

        return view
    }
}
