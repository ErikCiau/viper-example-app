//
//  ProfileManagerNetwork.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 21/11/22.
//

import Foundation
import UIKit

struct TodoModel: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: CodingKey {
        case userId
        case id
        case title
        case completed
    }

    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<TodoModel.CodingKeys> = try decoder.container(keyedBy: TodoModel.CodingKeys.self)

        userId = try container.decode(Int.self, forKey: TodoModel.CodingKeys.userId)
        id = try container.decode(Int.self, forKey: TodoModel.CodingKeys.id)
        title = try container.decode(String.self, forKey: TodoModel.CodingKeys.title)
        completed = try container.decode(Bool.self, forKey: TodoModel.CodingKeys.completed)
    }
}

class ProfileManagerNetwork {
    init() {
        getUserProfile { completion in
            print(completion.title)
        }
    }

    func getUserProfile(completion: @escaping (_ todo: TodoModel) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, _, _ in
            do {
                let response = try JSONDecoder().decode(TodoModel.self, from: data!)
                DispatchQueue.main.async {
                    completion(response)
                }
            } catch let error as NSError {
                fatalError(error.description)
            }
        }.resume()
    }
}
