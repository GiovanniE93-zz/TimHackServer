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

    @nonobjc public class func getListItemFetchRequest() -> NSFetchRequest<Totem> {
        let request = Totem.fetchRequest() as! NSFetchRequest<Totem>
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        return request
    }

    @NSManaged public var name: String?
    @NSManaged public var city: String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}
