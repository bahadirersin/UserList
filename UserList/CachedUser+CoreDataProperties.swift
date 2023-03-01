//
//  CachedUser+CoreDataProperties.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friend: NSSet?

    public var wrappedName:String{
        name ?? "Unknown Name"
    }
    
    public var wrappedEmail:String{
        email ?? "Unknown Email"
    }
    
    public var wrappedAddress:String{
        address ?? "Unknown Address"
    }
    
    public var wrappedAbout:String{
        about ?? "Unknown About"
    }
    
    public var wrappedCompany:String{
        company ?? "Unknown Company"
    }
    
    public var friendArray: [CachedFriend]{
        let set = friend as? Set<CachedFriend> ?? []
        
        return set.sorted{
            $0.wrappedName < $1.wrappedName
        }
    }
    
    public var tagArray: [String]{
        tags?.components(separatedBy: ",") ?? ["Unknown Tag"]
    }
    
}

// MARK: Generated accessors for friend
extension CachedUser {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: CachedFriend)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: CachedFriend)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
