//
//  ProfileDataManagerProtocol.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 22/11/22.
//

import Foundation

protocol ProfileDataManagerProtocol {
    func getUserProfile(completion: @escaping (Result<ProfileEntity, NSError>) -> Void)
    func createUserProfile(completion: @escaping (Result<ProfileEntity, NSError>) -> Void)
}
