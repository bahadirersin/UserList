//
//  UserList.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//

import Foundation

class Users:ObservableObject{
    
    @Published var users:[User]
    
    init(){
        users = Bundle.main.decode(url: "https://www.hackingwithswift.com/samples/friendface.json")
    }

}
