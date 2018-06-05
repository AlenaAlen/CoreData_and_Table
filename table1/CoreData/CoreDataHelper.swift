//
//  CoreDataHelper.swift
//  table1
//
//  Created by Alena Kropotova on 05.06.2018.
//  Copyright © 2018 Alena Kropotova. All rights reserved.
//

import CoreData

class CoreDataHelper : NSObject{
    
    
    static var instace = CoreDataHelper()
     private override init() {}
    
    lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        
        return urls[urls.count-1]
    }()
    
    lazy var managedObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: "table1", withExtension: "momd")!//Ваше название проекта/базы данных
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("table1.sqlite") //Ваше название проекта/базы данных
        var failureReason = "There was an error creating or loading the application's saved data."
        do {
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data" as AnyObject
            dict[NSLocalizedFailureReasonErrorKey] = failureReason as AnyObject
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        return coordinator
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = {
        let coordinator = self.persistentStoreCoordinator
        var managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType )
        managedObjectContext.persistentStoreCoordinator = coordinator
        return managedObjectContext
    }()
    
    func saveContext () {
        
        if true {
            do {
                try managedObjectContext.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
               
            }
        }
    }
    
    
}

