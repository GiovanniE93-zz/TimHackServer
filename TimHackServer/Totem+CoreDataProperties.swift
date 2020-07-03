//
//  Totem+CoreDataProperties.swift
//  TimHackServer
//
//  Created by Giovanni Erpete on 03/07/2020.
//  Copyright © 2020 Giovanni Erpete. All rights reserved.
//
//

import Foundation
import CoreData


extension Totem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Totem> {
        return NSFetchRequest<Totem>(entityName: "Totem")
    }

    @NSManaged public var name: String?
    @NSManaged public var city: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}
