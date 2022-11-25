//
//  ProfileListProtocol.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 23/11/22.
//

import Foundation
import UIKit

protocol ProfileListViewProtocol: AnyObject {
    var presenter: ProfileListPresenterProtocol? { get set }
    // presenter -> view
    func showProfiles(_ profiles: [ProfileEntity])
}

protocol ProfileListPresenterProtocol: AnyObject {
    var view: ProfileListViewProtocol? { get set }
    var interactor: ProfileListInteractorInputProtocol? { get set }
    var router: ProfileListRouterProtocol? { get set }
    // view -> presnter
    func viewDidLoad()
    func showProfileForm()
    func showProfileDetail(profile: ProfileEntity)
}

protocol ProfileListInteractorInputProtocol: AnyObject {
    var presenter: ProfileListInteractorOutputProtocol? { get set }
    var dataManager: ProfileListManagerProtocol? { get set }
    // presenter -> interactor
    func loadProfiles()
}

protocol ProfileListInteractorOutputProtocol: AnyObject {
    // interactor -> presenter
    func didLoadProfiles(_ profiles: [ProfileEntity])
}

protocol ProfileListRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func showProfileForm(_ view: ProfileListViewProtocol)
    func showProfileDetailView(_ view: ProfileListViewProtocol, _ profile: ProfileEntity)
}

protocol ProfileListManagerProtocol: AnyObject {
    func loadProfiles(completion: @escaping (Result<[ProfileEntity], NSError>) -> Void)
//    func createProfile(from profile: ProfileEntity, completion: @escaping (Result<ProfileEntity, NSError>) -> Void)
//    func updateProfile(id profileId: Int, data profile: ProfileEntity, completion: @escaping (Result<ProfileEntity, NSError>) -> Void)
//    func deleteProfile(id profileId: Int, completion: @escaping (Result<Bool, NSError>) -> Void)
}
