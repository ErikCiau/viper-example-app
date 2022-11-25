//
//  ProfileDetailProtocol.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 19/11/22.
//

import Foundation
import UIKit

protocol ProfileDetailRouterProtocol: AnyObject {
    static func createModule(with profile: ProfileEntity) -> UIViewController
}

protocol ProfileDetailViewProtocol: AnyObject {
    var presenter: ProfileDetailPresenterProtocol? { get set }
    // presenter -> view
    func showProfile(_ profile: ProfileEntity)
    func onUpdatedProfile()
    func onDeleteProfile()
}

protocol ProfileDetailPresenterProtocol: AnyObject {
    var view: ProfileDetailViewProtocol? { get set }
    var interactor: ProfileDetailInteractorProtocol? { get set }
    var router: ProfileDetailRouterProtocol? { get set }
    // view -> presenter
    func viewDidLoad()
    func changeStateProfile(_ profile: ProfileEntity)
    func deleteProfile(_ profile: ProfileEntity)
}

protocol ProfileDetailInteractorProtocol: AnyObject {
    var presenter: ProfileDetailInteractorOutputProtocol? { get set }
    var profile: ProfileEntity? { get set }
    var dataManager: ProfileDetailManagerProtocol? { get set }
    // Presenter -> Interactor
    func loadProfile()
    func updateProfile(_ profile: ProfileEntity)
    func deleteProfile(_ profile: ProfileEntity)
}

protocol ProfileDetailInteractorOutputProtocol: AnyObject {
    // Interactor -> Presenter
    func didShowProfile(_ profile: ProfileEntity)
    func didUpdatedProfile()
    func didDeleteProfile()
}

protocol ProfileDetailManagerProtocol: AnyObject {
    func updateProfile(_ profile: ProfileEntity, completion: @escaping (Result<Bool, NSError>) -> Void)
    func deleteProfile(_ profile: ProfileEntity, completion: @escaping (Result<Bool, NSError>) -> Void)
}
