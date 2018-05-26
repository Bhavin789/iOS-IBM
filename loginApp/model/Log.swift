//
//  Log.swift
//  loginApp
//
//  Created by Bhavin on 25/05/18.
//  Copyright © 2018 Bhavin. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Log{
    class func getContext() -> NSManagedObjectContext{
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    class func saveObject(title: String, feedback: String, keywords: String, time: Date) -> Bool{
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Log", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObject.setValuesForKeys(["title" : title, "feedback" : feedback, "keywords" : keywords, "time": time ])
        do {
            try context.save()
            print("Success")
            return true
        } catch  {
            print("Error while saving")
            return false
        }
    }
    
    class func getLogs() -> [Log]?{
        let context = getContext()
        var logs: [Log]? = nil
        do {
            logs = try context.fetch(Log.fetchRequest())
        } catch  {
            print("Error in fetching")
            
        }
        
        return logs
    }
}
