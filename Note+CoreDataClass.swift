//
//  Note+CoreDataClass.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 21/3/24.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {
    convenience init(context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: "NoteMO", in: context)!
        self.init(entity: entity, insertInto: context)
    }

}
