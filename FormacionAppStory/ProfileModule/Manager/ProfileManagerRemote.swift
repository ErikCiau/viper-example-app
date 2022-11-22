//
//  ProfileManagerRemote.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 21/11/22.
//

import Foundation

class ProfileManagerRemote {
    private init() {}

    public static let shared = ProfileManagerRemote()

    public func getUserProfile(completion: @escaping (_ profile: ProfileEntity) -> Void) {
        guard let url = URL(string: "https://kr-persona-negtal.brmdocp.banregio.com/personas/2085") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            do {
                let userProfile = try JSONDecoder().decode(ProfileEntity.self, from: data)
                DispatchQueue.main.async {
                    completion(userProfile)
                }
                print(data)
            } catch let error as NSError {
                fatalError(error.description)
            }
        }

        task.resume()
    }
}
