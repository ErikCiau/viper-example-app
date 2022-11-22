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

    func getUserProfile(completion: @escaping (ProfileEntity) -> Void, failure: @escaping (NSError) -> Void) {
        AF.request("", method: .get).responseDecodable(of: ProfileEntity.self) { _ in
        }
    }
}
