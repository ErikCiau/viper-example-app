//
//  ProfileListManagerSQLite.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 23/11/22.
//

import Foundation
import GRDB

class ProfileListManagerSQLite: ProfileListManagerProtocol {
    func connection() -> DatabaseQueue {
        let path = Bundle.main.path(forResource: "formaciondesarrollo", ofType: "db")
        return try! DatabaseQueue(path: path!)
    }

    static var shared = ProfileListManagerSQLite()

    func loadProfiles(completion: @escaping (Result<[ProfileEntity], NSError>) -> Void) {
        do {
            let profiles = try connection().read({ try ProfileEntity.fetchAll($0) })
            completion(.success(profiles))
        } catch {
            print(error)
        }
    }

//    func createProfile(from profile: ProfileEntity, completion: @escaping (Result<ProfileEntity, NSError>) -> Void) {
//        do {
//            let profile = ProfileEntity(id: Int(profile.id), primerNombre: profile.primerNombre, segundoNombre: profile.segundoNombre, apellidoPaterno: profile.apellidoPaterno, apellidoMaterno: profile.apellidoMaterno, curp: profile.curp, rfc: profile.rfc, linkCurriculum: profile.linkCurriculum, activo: profile.activo)
//            _ = try connection().write { db in
//                try profile.insert(db)
//            }
//            completion(.success(profile))
//        } catch {
//            print(error)
//        }
//    }
//
//    func updateProfile(id profileId: Int, data profile: ProfileEntity, completion: @escaping (Result<ProfileEntity, NSError>) -> Void) {
//        let query = "UPDATE tblProfile SET primerNombre = ? WHERE id = ?"
//        let arguments: StatementArguments = [profile.primerNombre, profileId]
//        do {
//            try connection().write { db in
//                try db.execute(sql: query, arguments: arguments)
//            }
//            completion(.success(profile))
//        } catch {
//            print(error)
//        }
//    }
//
//    func deleteProfile(id profileId: Int, completion: @escaping (Result<Bool, NSError>) -> Void) {
//        do {
//            _ = try connection().write { try ProfileEntity.deleteOne($0, key: ["id": profileId]) }
//            completion(.success(true))
//        } catch {
//            print(error)
//        }
//    }
}
