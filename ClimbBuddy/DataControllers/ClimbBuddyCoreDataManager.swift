//
//  ClimbBuddyCoreDataManager.swift
//  ClimbBuddy
//
//  Created by Kristine Otto on 8/30/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ClimbBuddyCoreDataManager {
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    func saveClimb(date: Date, startTime: Date, endTime: Date, grade: String, feeling: String) {
        if let managedContext = appDelegate?.persistentContainer.viewContext {
            let entity = NSEntityDescription.entity(forEntityName: "Climbs", in: managedContext)
            let climb = NSManagedObject(entity: entity!, insertInto: managedContext)
            climb.setValue(date, forKey: "date")
            climb.setValue(startTime, forKey: "startTime")
            climb.setValue(endTime, forKey: "endTime")
            climb.setValue(feeling, forKey: "feeling")
            climb.setValue(grade, forKey: "grade")
            do {
                try managedContext.save()
            }
            catch let error as NSError {
                print("There was an error saving Climb: \(error)")
            }
        }
    }
}
