//
//  Bundle-JsonDecode.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//

import Foundation

extension Bundle{
    
    func decode<T:Codable>(url:String) -> T {
        
        guard let extUrl = URL(string: url) else{
            fatalError("Can not create URL")
        }
        
        guard let data = try? Data(contentsOf: extUrl) else{
            fatalError("Can not parse data")
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        guard let decodedContent = try? decoder.decode(T.self, from: data) else{
            fatalError("Can not decode data")
        }
        
        return decodedContent
    }
}
