//
//  ProfileCreatorRouter.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 25/11/22.
//

import Foundation
import UIKit

class ProfileCreatorRouter: ProfileCreatorRouterProtocol {
    private static var screenView: UIStoryboard = {
        UIStoryboard(name: "ProfileCreator", bundle: nil)
    }()

    static func createModule() -> UIViewController {
        let view = screenView.instantiateViewController(withIdentifier: "ProfileCreatorVC") as! ProfileCreatorVC
        let presenter: ProfileCreatorPresenterProtocol & ProfileCreatorInteractorOutputProtocol = ProfileCreatorPresenter()
        let interactor: ProfileCreatorInteractorInputProtocol = ProfileCreatorInteractor()
        let router: ProfileCreatorRouterProtocol = ProfileCreatorRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.dataManager = ProfileCreatorManagerSQlite.shared

        return view
    }
}
