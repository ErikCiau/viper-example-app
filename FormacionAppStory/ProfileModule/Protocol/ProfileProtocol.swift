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
    func pushDetailScreen(from view: ProfileViewProtocol)
}

protocol ProfileViewProtocol: AnyObject {
    var presenter: ProfilePresenterProtocol? { get set }
    // presenter -> View
}

protocol ProfilePresenterProtocol: AnyObject {
    var view: ProfileViewProtocol? { get set }
    var interactor: ProfileInteractorInputProtocol? { get set }
    var router: ProfileRouterProtocol? { get set }
    //    View -> Presenter
    func selectedDetail()
}

protocol ProfileInteractorInputProtocol {
    var presenter: ProfileInteractorOutputProtocol? { get set }
    var localManager: ProfileDataManager? { get set }
    // presenter -> Interactor
}

protocol ProfileInteractorOutputProtocol {
    // Interactor -> presenter
}
