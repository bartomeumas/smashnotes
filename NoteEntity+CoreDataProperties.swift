//
//  NoteEntity+CoreDataProperties.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 21/3/24.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var extraDetails: String?
    @NSManaged public var id: UUID?
    @NSManaged public var playerName: String?
    @NSManaged public var winCondition: String?
    @NSManaged public var habits: NSSet?
    @NSManaged public var mains: NSSet?
    @NSManaged public var stagesToBan: NSSet?

}

// MARK: Generated accessors for habits
extension Note {

    @objc(addHabitsObject:)
    @NSManaged public func addToHabits(_ value: HabitEntity)

    @objc(removeHabitsObject:)
    @NSManaged public func removeFromHabits(_ value: HabitEntity)

    @objc(addHabits:)
    @NSManaged public func addToHabits(_ values: NSSet)

    @objc(removeHabits:)
    @NSManaged public func removeFromHabits(_ values: NSSet)

}

// MARK: Generated accessors for mains
extension Note {

    @objc(addMainsObject:)
    @NSManaged public func addToMains(_ value: CharacterEntity)

    @objc(removeMainsObject:)
    @NSManaged public func removeFromMains(_ value: CharacterEntity)

    @objc(addMains:)
    @NSManaged public func addToMains(_ values: NSSet)

    @objc(removeMains:)
    @NSManaged public func removeFromMains(_ values: NSSet)

}

// MARK: Generated accessors for stagesToBan
extension Note {

    @objc(addStagesToBanObject:)
    @NSManaged public func addToStagesToBan(_ value: CharacterType)

    @objc(removeStagesToBanObject:)
    @NSManaged public func removeFromStagesToBan(_ value: CharacterType)

    @objc(addStagesToBan:)
    @NSManaged public func addToStagesToBan(_ values: NSSet)

    @objc(removeStagesToBan:)
    @NSManaged public func removeFromStagesToBan(_ values: NSSet)

}

extension Note : Identifiable {

}
