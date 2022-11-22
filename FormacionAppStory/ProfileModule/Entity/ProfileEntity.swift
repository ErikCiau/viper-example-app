//
//  ProfileEntity.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 18/11/22.
//

import Foundation

 struct ProfileEntity: Decodable {
    var id: Int64
    var primerNombre: String
    var segundoNombre: String
    var apellidoMaterno: String
    var apellidoPaterno: String
    var curp: String
    var rfc: String
    var linkCurriculum: String
    var activo: Bool

    enum CodingKeys: CodingKey {
        case id
        case primerNombre
        case segundoNombre
        case apellidoMaterno
        case apellidoPaterno
        case curp
        case rfc
        case linkCurriculum
        case activo
    }

    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<ProfileEntity.CodingKeys> = try decoder.container(keyedBy: ProfileEntity.CodingKeys.self)

        self.id = try container.decode(Int64.self, forKey: ProfileEntity.CodingKeys.id)
        self.primerNombre = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.primerNombre)
        self.segundoNombre = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.segundoNombre)
        self.apellidoMaterno = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.apellidoMaterno)
        self.apellidoPaterno = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.apellidoPaterno)
        self.curp = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.curp)
        self.rfc = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.rfc)
        self.linkCurriculum = try container.decode(String.self, forKey: ProfileEntity.CodingKeys.linkCurriculum)
        self.activo = try container.decode(Bool.self, forKey: ProfileEntity.CodingKeys.activo)

    }
 }

//struct ProfileEntity {
//    var id: Int64
//    var primerNombre: String
//    var segundoNombre: String
//    var apellidoMaterno: String
//    var apellidoPaterno: String
//    var curp: String
//    var rfc: String
//    var linkCurriculum: String
//    var activo: Bool
//}
