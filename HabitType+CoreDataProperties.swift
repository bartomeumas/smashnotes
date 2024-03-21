//
//  HabitType+CoreDataProperties.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 21/3/24.
//
//

import Foundation
import CoreData


extension HabitType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HabitType> {
        return NSFetchRequest<HabitType>(entityName: "HabitTypeMO")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var text: String?

}

extension HabitType : Identifiable {

}
