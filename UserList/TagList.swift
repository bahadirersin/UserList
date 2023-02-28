//
//  TagList.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//

import SwiftUI

struct TagList: View {
    
    let user:User
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment:.center){
                ForEach(user.tags, id:\.self){
                    Text("\($0)")
                        .padding(.horizontal)
                        .padding(5)
                        .font(.caption)
                        .fontWeight(.black)
                        .background(.black.opacity(0.75))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .overlay{
                            Capsule()
                                .strokeBorder(.secondary,lineWidth: 1)
                        }
                }
            }
        }
    }
}

struct TagList_Previews: PreviewProvider {
    static var previews: some View {
        let usus:[User] =  Bundle.main.decode(url: "https://www.hackingwithswift.com/samples/friendface.json")
        TagList(user:usus[0])
    }
}
