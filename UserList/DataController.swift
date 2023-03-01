//
//  DataController.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//
import CoreData
import Foundation

class DataController:ObservableObject{
    let container = NSPersistentContainer(name:"UserModel")
    
    init(){
        container.loadPersistentStores{description, error in
            if let error = error{
                print("Core data failed to load: \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
        
    }
}
