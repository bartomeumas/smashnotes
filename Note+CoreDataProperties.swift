//
//  Note+CoreDataProperties.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 21/3/24.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "NoteMO")
    }


    @NSManaged public var extraDetails: String
    @NSManaged public var id: UUID?
    @NSManaged public var playerName: String
    @NSManaged public var winCondition: String
    @NSManaged public var habits: NSSet?
    @NSManaged public var mains: NSSet?
    @NSManaged public var stagesToBan: NSSet?
}

extension Note {

    @objc(addHabitsObject:)
    @NSManaged public func addToHabits(_ value: Habit)

    @objc(removeHabitsObject:)
    @NSManaged public func removeFromHabits(_ value: Habit)

    @objc(addHabits:)
    @NSManaged public func addToHabits(_ values: NSSet)

    @objc(removeHabits:)
    @NSManaged public func removeFromHabits(_ values: NSSet)

}

// MARK: Generated accessors for mains
extension Note {

    @objc(addMainsObject:)
    @NSManaged public func addToMains(_ value: Character)

    @objc(removeMainsObject:)
    @NSManaged public func removeFromMains(_ value: Character)

    @objc(addMains:)
    @NSManaged public func addToMains(_ values: NSSet)

    @objc(removeMains:)
    @NSManaged public func removeFromMains(_ values: NSSet)

}

// MARK: Generated accessors for stagesToBan
extension Note {

    @objc(addStagesToBanObject:)
    @NSManaged public func addToStagesToBan(_ value: Stage)

    @objc(removeStagesToBanObject:)
    @NSManaged public func removeFromStagesToBan(_ value: Stage)

    @objc(addStagesToBan:)
    @NSManaged public func addToStagesToBan(_ values: NSSet)

    @objc(removeStagesToBan:)
    @NSManaged public func removeFromStagesToBan(_ values: NSSet)

}

extension Note : Identifiable {

}
