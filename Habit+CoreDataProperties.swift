//
//  Habit+CoreDataProperties.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 21/3/24.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "HabitMO")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var text: String
    @NSManaged public var habitType: HabitType?

}

extension Habit : Identifiable {

}
