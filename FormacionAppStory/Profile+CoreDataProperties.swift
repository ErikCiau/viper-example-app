//
//  Profile+CoreDataProperties.swift
//  FormacionAppStory
//
//  Created by Erik Ciau on 18/11/22.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var id: Int64
    @NSManaged public var primerNombre: String?
    @NSManaged public var segundoNombre: String?
    @NSManaged public var apellidoMaterno: String?
    @NSManaged public var apellidoPaterno: String?
    @NSManaged public var curp: String?
    @NSManaged public var rfc: String?
    @NSManaged public var linkCurriculum: String?
    @NSManaged public var activo: Bool

}

extension Profile : Identifiable {

}
