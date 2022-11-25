//
//  ProfileDetailManagerSQLite.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 25/11/22.
//

import Foundation
import GRDB

class ProfileDetailManagerSQLite: ProfileDetailManagerProtocol {
    private init() { }

    func connection() -> DatabaseQueue {
        let path = Bundle.main.path(forResource: "formaciondesarrollo", ofType: "db")
        return try! DatabaseQueue(path: path!)
    }

    static var shared = ProfileDetailManagerSQLite()

    func updateProfile(_ profile: ProfileEntity, completion: @escaping (Result<Bool, NSError>) -> Void) {
        let query = "UPDATE tblProfile SET activo = ? WHERE id = ?"
        let arguments: StatementArguments = [!profile.activo, profile.id]
        do {
            try connection().write { db in
                try db.execute(sql: query, arguments: arguments)
            }
            completion(.success(true))
        } catch {
            print(error)
        }
    }

    func deleteProfile(_ profile: ProfileEntity, completion: @escaping (Result<Bool, NSError>) -> Void) {
        let query = "DELETE FROM tblProfile WHERE id = ?"
        let arguments: StatementArguments = [profile.id]
        do {
            try connection().write { db in
                try db.execute(sql: query, arguments: arguments)
            }
            completion(.success(true))
        } catch {
            print(error)
        }
    }
}
