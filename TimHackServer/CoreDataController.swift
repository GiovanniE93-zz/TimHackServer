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
    
    func saveTotem() {
        
//        save a new record
        
    }
    
    func modifyTotem() {
        
//        modify an existing record
        
    }
    
    func deleteTotem() {
        
//        delete an existing totem
        
    }
    
}
