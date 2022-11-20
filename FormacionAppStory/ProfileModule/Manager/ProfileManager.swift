//
//  ProfileManager.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 18/11/22.
//

import Foundation

class ProfileDataManager {
    var profiles: [ProfileEntity] = [
        ProfileEntity(id: 1, name: "Erik Ciau"),
        ProfileEntity(id: 2, name: "Antonio Gomez"),
    ]

    public func addProfile(profile: ProfileEntity) {
        profiles.append(profile)
    }

    public func removeProfile(profile: ProfileEntity) {
        if let index = profiles.firstIndex(where: { $0.id == profile.id }) {
            profiles.remove(at: index)
        }
    }
}
