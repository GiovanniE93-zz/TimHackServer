//
//  CoreDataController.swift
//  TimHackServer
//
//  Created by Giovanni Erpete on 03/07/2020.
//  Copyright © 2020 Giovanni Erpete. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataController {
    
    static let shared = CoreDataController()
    
    private var context : NSManagedObjectContext
    
    private init() {
        
        let application = UIApplication.shared.delegate as! AppDelegate
        self.context = application.persistentContainer.viewContext
        
    }
    
    func addTotem(latitude: Double, longitude: Double, title: String, city: String) {
        
//        save a new record
        
        let totem = Totem(context: self.context)
        totem.name = title
        totem.latitude = latitude
        totem.longitude = longitude
        totem.city = city
        saveTotem()
        
        
    }
    
    func modifyTotem() {
        
//        modify an existing record
        
    }
    
    func deleteTotem() {
        
//        delete an existing totem
        
    }
    
    func saveTotem() {
        
        do {
            try self.context.save()
        } catch {
            print("Errore!")
        }
        
    }
    
}
