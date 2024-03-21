//
//  Stage+CoreDataProperties.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 21/3/24.
//
//

import Foundation
import CoreData


extension Stage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stage> {
        return NSFetchRequest<Stage>(entityName: "StageMO")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var text: String?

}

extension Stage : Identifiable {

}
