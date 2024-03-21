//
//  Character+CoreDataProperties.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 21/3/24.
//
//

import Foundation
import CoreData


extension Character {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Character> {
        return NSFetchRequest<Character>(entityName: "CharacterMO")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var characterType: CharacterType?

}

extension Character : Identifiable {

}
