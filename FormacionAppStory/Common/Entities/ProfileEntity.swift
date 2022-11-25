//
//  ProfileEntity.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 18/11/22.
//

import Foundation
import GRDB

// struct ProfileEntity: Decodable {
//    var id: Int64
//    var primerNombre: String
//    var segundoNombre: String
//    var apellidoMaterno: String
//    var apellidoPaterno: String
//    var curp: String
//    var rfc: String
//    var linkCurriculum: String
//    var activo: Bool
//
//    enum CodingKeys: CodingKey {
//        case id
//        case primerNombre
//        case segundoNombre
//        case apellidoMaterno
//        case apellidoPaterno
//        case curp
//        case rfc
//        case linkCurriculum
//        case activo
//    }
//
//    init(from decoder: Decoder) throws {
//        let container: KeyedDecodingContainer<ProfileEntity.CodingKeys> = try decoder.container(keyedBy: ProfileEntity.CodingKeys.self)
//
//        self.id = try container.decode(Int64.self, forKey: ProfileEntity.CodingKeys.id)
//        self.primerNombre = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.primerNombre)
//        self.segundoNombre = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.segundoNombre)
//        self.apellidoMaterno = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.apellidoMaterno)
//        self.apellidoPaterno = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.apellidoPaterno)
//        self.curp = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.curp)
//        self.rfc = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.rfc)
//        self.linkCurriculum = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.linkCurriculum)
//        self.activo = try container.decode(Bool.self, forKey: ProfileEntity.CodingKeys.activo)
//
//    }
// }

struct ProfileEntity: Codable, FetchableRecord, PersistableRecord {
    static var databaseTableName: String = "tblProfile"
    var id: Int64
    var primerNombre: String
    var segundoNombre: String
    var apellidoMaterno: String
    var apellidoPaterno: String
    var curp: String
    var rfc: String
    var linkCurriculum: String
    var activo: Bool

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int64.self, forKey: .id)
        primerNombre = try container.decode(String.self, forKey: .primerNombre)
        segundoNombre = try container.decode(String.self, forKey: .segundoNombre)
        apellidoMaterno = try container.decode(String.self, forKey: .apellidoMaterno)
        apellidoPaterno = try container.decode(String.self, forKey: .apellidoPaterno)
        curp = try container.decode(String.self, forKey: .curp)
        rfc = try container.decode(String.self, forKey: .rfc)
        linkCurriculum = try container.decode(String.self, forKey: .linkCurriculum)
        activo = try container.decode(Bool.self, forKey: .activo)
    }

    init(from contextModule: Profile) {
        id = contextModule.id
        primerNombre = contextModule.primerNombre ?? ""
        segundoNombre = contextModule.segundoNombre ?? ""
        apellidoPaterno = contextModule.apellidoPaterno ?? ""
        apellidoMaterno = contextModule.apellidoMaterno ?? ""
        curp = contextModule.curp ?? ""
        rfc = contextModule.rfc ?? ""
        linkCurriculum = contextModule.linkCurriculum ?? ""
        activo = contextModule.activo
    }

    init(id: Int, primerNombre: String, segundoNombre: String, apellidoPaterno: String, apellidoMaterno: String, curp: String, rfc: String, linkCurriculum: String, activo: Bool) {
        self.id = Int64(id)
        self.primerNombre = primerNombre
        self.segundoNombre = segundoNombre
        self.apellidoPaterno = apellidoPaterno
        self.apellidoMaterno = apellidoMaterno
        self.curp = curp
        self.rfc = rfc
        self.linkCurriculum = linkCurriculum
        self.activo = activo
    }
}
