//
//  ProfileRouter.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 18/11/22.
//

import Foundation
import UIKit

class ProfileRouter: ProfileRouterProtocol {
    private static var screenView: UIStoryboard = {
        UIStoryboard(name: "ProfileView", bundle: nil)
    }()

    static func createModule() -> UIViewController {
        let view = screenView.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        let presenter: ProfilePresenterProtocol & ProfileInteractorOutputProtocol = ProfilePresenter()
        var interactor: ProfileInteractorInputProtocol = ProfileInteractor()
        let router: ProfileRouterProtocol = ProfileRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.dataManager = ProfileDataManagerRemote.shared // data manager with urlsession
        // interactor.dataManager = ProfileDataManagerWithAlamofire.shared // data manager with alamofire

        return view
    }
}
