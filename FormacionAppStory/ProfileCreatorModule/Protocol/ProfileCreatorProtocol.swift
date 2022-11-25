//
//  ProfileCreatorProtocol.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 25/11/22.
//

import Foundation
import UIKit

protocol ProfileCreatorViewProtocol: AnyObject {
    var presenter: ProfileCreatorPresenterProtocol? { get set }
    func onCreatedProfile()
}

protocol ProfileCreatorPresenterProtocol: AnyObject {
    var view: ProfileCreatorViewProtocol? { get set }
    var interactor: ProfileCreatorInteractorInputProtocol? { get set }
    var router: ProfileCreatorRouterProtocol? { get set }
    func viewDidLoad()

    func createProfile(_ profile: ProfileEntity)
}

protocol ProfileCreatorInteractorInputProtocol: AnyObject {
    var presenter: ProfileCreatorInteractorOutputProtocol? { get set }
    var dataManager: ProfileCreatorDataManagerProtocol? { get set }
    func createProfile(_ profile: ProfileEntity)
}

protocol ProfileCreatorInteractorOutputProtocol: AnyObject {
    func didCreateProfile()
}

protocol ProfileCreatorRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}

protocol ProfileCreatorDataManagerProtocol {
    func registerProfile(_ profile: ProfileEntity, completion: @escaping (Result<Bool, NSError>) -> Void)
}
