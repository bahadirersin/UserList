//
//  UserList.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//

import SwiftUI
import Foundation

class Users:ObservableObject{
    
    @Published var fetchedUsers:[User]
    
    init(){
        fetchedUsers = Bundle.main.decode(url: "https://www.hackingwithswift.com/samples/friendface.json")
    }
    

}
