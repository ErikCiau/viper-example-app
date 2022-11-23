//
//  ProfileDataManagerWithAlamofire.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 22/11/22.
//

import Alamofire
import Foundation

class ProfileDataManagerWithAlamofire: ProfileDataManagerProtocol {
    private init() { }
    public static var shared = ProfileDataManagerWithAlamofire()

    func getUserProfile(completion: @escaping (Result<ProfileEntity, NSError>) -> Void) {
        AF.request("", method: .get).responseDecodable(of: ProfileEntity.self) { _ in
        }
    }

    func createUserProfile(completion: @escaping (Result<ProfileEntity, NSError>) -> Void) {
    }
}
