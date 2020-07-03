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
    
    func fetchTotems() {
        
        let request = Totem.getListItemFetchRequest()
        
        do {
            let result = try self.context.fetch(request)
            for data in result {
                print("[FetchTotems]: name: \(data.name!)")
            }
        } catch {
            print("[FetchTotems]: Error!")
        }
    }
    
    func modifyTotem(name: String) {
        
//        modify an existing record
        let i = findTotem(name: name)
        
        
    }
    
    func deleteTotem(name: String) {
        
//        delete an existing totem
        let i = findTotem(name: name)
        
        let request = Totem.getListItemFetchRequest()
        
        do {
            let results = try self.context.fetch(request)
            let listItem = results[i]
            self.context.delete(listItem)
            
        } catch {
            print("[DeleteItem]: Error!")
        }
        
    }
    
    func deleteAllTotems() {
        let request = Totem.getListItemFetchRequest()
        
        do {
            let results = try self.context.fetch(request)
            for elem in results {
                self.context.delete(elem)
            }
        } catch {
            print("[DeleteAllTotems]: Error!")
        }
    }
    
    func findTotem(name: String) -> Int {
        
        var i = 0
        var trovato = false
        let request = Totem.getListItemFetchRequest()
        
        do {
            let results = try self.context.fetch(request)
            for elem in results {
                if(elem.name == name && !trovato) {
                    trovato = true
                    print("[FindTotem] \(name) trovato!")
                } else {
                    i += 1
                }
            }
        } catch {
            print("[FindTotem] Error!")
        }
        
        if(!trovato) {
            print("[FindTotem] \(name) non trovato!")
            i = -1
        }
        
        return i
        
    }
    
    func saveTotem() {
        
        do {
            try self.context.save()
        } catch {
            print("Errore!")
        }
        
    }
    
}
