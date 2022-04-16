//
//  CoreDataManager.swift
//  LABS
//
//  Created by Viktor Andreev on 15.04.2022.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    var readContext: NSManagedObjectContext { get }
    var writeContext: NSManagedObjectContext { get }
}

final class CoreDataManager: CoreDataManagerProtocol {
    
    let persistentContainer = NSPersistentContainer(name: "ExchangeRate")
    
    var readContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    var writeContext: NSManagedObjectContext {
        persistentContainer.newBackgroundContext()
    }
    
    init() {
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                assertionFailure("Error: \(error)")
            }
        }
    }
}
