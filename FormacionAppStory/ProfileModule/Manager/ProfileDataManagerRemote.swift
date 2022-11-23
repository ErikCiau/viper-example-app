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

    func getUserProfile(completion: @escaping (Result<ProfileEntity, NSError>) -> Void) {
        guard let url = URL(string: "") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/x-www-form-urlencoded; charset=utf8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")

        URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            do {
                let data = try JSONDecoder().decode(ProfileEntity.self, from: data)
                completion(.success(data))
            } catch let error as NSError {
                completion(.failure(error))
            }
        }
    }

    func createUserProfile(completion: @escaping (Result<ProfileEntity, NSError>) -> Void) {}
}
