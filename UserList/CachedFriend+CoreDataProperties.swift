//
//  CachedFriend+CoreDataProperties.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?

    public var wrappedName: String{
        name ?? "Unknown Friend"
    }
}

extension CachedFriend : Identifiable {

}
