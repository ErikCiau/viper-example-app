//
//  ProfileDataManagerLocal.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 22/11/22.
//

import CoreData
import Foundation
import UIKit

class ProfileDataManagerLocal: ProfileDataManagerProtocol {
    private init() {}

    public static let shared = ProfileDataManagerLocal()

    func getUserProfile(completion: @escaping (Result<ProfileEntity, NSError>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Profile>
        fetchRequest = Profile.fetchRequest()

        do {
            guard let profile = try context.fetch(fetchRequest).first else { return }
            let entity = ProfileEntity(from: profile)
            completion(.success(entity))
        } catch let error as NSError {
            completion(.failure(error))
        }
    }

    func createUserProfile(completion: @escaping (Result<ProfileEntity, NSError>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let profile = Profile(context: context)

        profile.id = Int64(Int.random(in: 1 ... 100))
        profile.primerNombre = "Erik"
        profile.segundoNombre = "Antonio"
        profile.apellidoPaterno = "Ciau"
        profile.apellidoMaterno = "Gomez"
        profile.curp = "CIGE010528HYNXMRA1"
        profile.rfc = "CIGE0105285W9"
        profile.linkCurriculum = "https://www.erikciau.com"
        profile.activo = true

        do {
            try context.save()
            completion(.success(ProfileEntity(from: profile)))
        } catch let error as NSError {
            completion(.failure(error))
        }
    }
}
