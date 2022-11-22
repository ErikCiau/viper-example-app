//
//  ProfileDataManagerRemote.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 22/11/22.
//

import Foundation

class ProfileDataManagerRemote: ProfileDataManagerProtocol {
    private init() {}
    public static let shared = ProfileDataManagerRemote()

    func getUserProfile(completion: @escaping (ProfileEntity) -> Void, failure: @escaping (NSError) -> Void) {
        guard let url = URL(string: "") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            do {
                let data = try JSONDecoder().decode(ProfileEntity.self, from: data)
                DispatchQueue.main.async {
                    completion(data)
                }
            } catch let error as NSError {
                failure(error)
            }
        }
    }
}
