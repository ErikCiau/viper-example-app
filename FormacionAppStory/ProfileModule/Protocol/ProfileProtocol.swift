//
//  ProfileProtocol.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 18/11/22.
//

import Foundation
import UIKit

protocol ProfileRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

protocol ProfileViewProtocol: AnyObject {
    var presenter: ProfilePresenterProtocol? { get set }
    // presenter -> View
    func showProfile(_ profile: ProfileEntity)
}

protocol ProfilePresenterProtocol: AnyObject {
    var view: ProfileViewProtocol? { get set }
    var interactor: ProfileInteractorInputProtocol? { get set }
    var router: ProfileRouterProtocol? { get set }
    //    View -> Presenter
    func viewDidLoad()
}

protocol ProfileInteractorInputProtocol {
    var presenter: ProfileInteractorOutputProtocol? { get set }
    var dataManager: ProfileDataManagerProtocol? { get set }
    // presenter -> Interactor
    func loadProfile()
}

protocol ProfileInteractorOutputProtocol {
    // Interactor -> presenter
    func didLoadProfile(_ profile: ProfileEntity)
}
