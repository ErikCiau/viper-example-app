//
//  ProfileCreatorManagerSQLite.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 25/11/22.
//

import Foundation
import GRDB

class ProfileCreatorManagerSQlite: ProfileCreatorDataManagerProtocol {
    private init() { }

    static var shared = ProfileCreatorManagerSQlite()

    func connection() -> DatabaseQueue {
        let path = Bundle.main.path(forResource: "formaciondesarrollo", ofType: "db")
        return try! DatabaseQueue(path: path!)
    }

    func registerProfile(_ profile: ProfileEntity, completion: @escaping (Result<Bool, NSError>) -> Void) {
        do {
            let profile = ProfileEntity(id: Int(profile.id), primerNombre: profile.primerNombre, segundoNombre: profile.segundoNombre, apellidoPaterno: profile.apellidoPaterno, apellidoMaterno: profile.apellidoMaterno, curp: profile.curp, rfc: profile.rfc, linkCurriculum: profile.linkCurriculum, activo: profile.activo)
            _ = try connection().write { db in
                try profile.insert(db)
            }
            completion(.success(true))
        } catch {
            print(error)
        }
    }
}
