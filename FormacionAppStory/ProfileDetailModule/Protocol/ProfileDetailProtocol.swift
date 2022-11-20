//
//  ProfileDetailProtocol.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 19/11/22.
//

import Foundation
import UIKit

protocol ProfileDetailRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

protocol ProfileDetailViewProtocol: AnyObject {
    var presenter: ProfileDetailPresenterProtocol? { get set }
    // View -> Presenter
}

protocol ProfileDetailPresenterProtocol: AnyObject {
    var view: ProfileDetailViewProtocol? { get set }
    var interactor: ProfileDetailInteractorProtocol? { get set }
    var router: ProfileDetailRouterProtocol? { get set }
    // Presenter -> View
}

protocol ProfileDetailInteractorProtocol: AnyObject {
    var presenter: ProfileDetailInteractorOutputProtocol? { get set }
    // Presenter -> Interactor
}

protocol ProfileDetailInteractorOutputProtocol: AnyObject {
    // Interactor -> Presenter
}
