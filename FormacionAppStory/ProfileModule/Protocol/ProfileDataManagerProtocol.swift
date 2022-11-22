//
//  ProfileDataManagerProtocol.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 22/11/22.
//

import Foundation

protocol ProfileDataManagerProtocol {
    func getUserProfile(completion: @escaping (_ profile: ProfileEntity) -> Void, failure: @escaping (_ error: NSError) -> Void)
}
