//
//  User.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//

import Foundation

struct User:Codable,Identifiable{

    struct Friend:Codable, Hashable{
        var id:String
        var name:String
    }
    
    var id:String
    var isActive:Bool
    var name:String
    var age:Int
    var company:String
    var email:String
    var address:String
    var about:String
    var registered:Date
    var tags:[String]
    var friends:[Friend]

}
