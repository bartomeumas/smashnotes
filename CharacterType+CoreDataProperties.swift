//
//  CharacterType+CoreDataProperties.swift
//  Smash Notes
//
//  Created by Bartomeu Mas Castillo on 21/3/24.
//
//

import Foundation
import CoreData


extension CharacterType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterType> {
        return NSFetchRequest<CharacterType>(entityName: "CharacterTypeMO")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var text: String?

}

extension CharacterType : Identifiable {

}
