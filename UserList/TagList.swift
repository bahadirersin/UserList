//
//  TagList.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//

import SwiftUI

struct TagList: View {
    
    let user:CachedUser
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            HStack(alignment:.center){
                ForEach(user.tagArray, id:\.self){
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
