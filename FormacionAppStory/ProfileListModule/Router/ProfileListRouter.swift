//
//  ProfileListRouter.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 23/11/22.
//

import Foundation
import UIKit

class ProfileListRouter: ProfileListRouterProtocol {
    private static var screenView: UIStoryboard = {
        UIStoryboard(name: "ProfileList", bundle: nil)
    }()

    static func createModule() -> UIViewController {
        let view = screenView.instantiateViewController(withIdentifier: "ProfileListVC") as! ProfileListVC
        let presenter: ProfileListPresenterProtocol & ProfileListInteractorOutputProtocol = ProfileListPresenter()
        let interactor: ProfileListInteractorInputProtocol = ProfileListInteractor()
        let router: ProfileListRouterProtocol = ProfileListRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.dataManager = ProfileListManagerSQLite.shared // data manager with SQLite

        return view
    }

    func showProfileForm(_ view: ProfileListViewProtocol) {
        guard let view = view as? UIViewController else { return }
        let profileCreaetor = ProfileCreatorRouter.createModule()
        view.navigationController?.pushViewController(profileCreaetor, animated: true)
    }

    func showProfileDetailView(_ view: ProfileListViewProtocol, _ profile: ProfileEntity) {
        guard let view = view as? UIViewController else { return }
        let profileDetail = ProfileDetailRouter.createModule(with: profile)
        view.navigationController?.pushViewController(profileDetail, animated: true)
    }
}
