//
//  FriendsView.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//

import SwiftUI

struct FriendsView: View {
    
    let user:User
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        LazyVGrid(columns: columns){
                ForEach(user.friends, id:\.self){
                    Text("\($0.name)")
                        .padding(.horizontal)
                        .padding(5)
                        .frame(minHeight: 50)
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

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        let usus:[User] =  Bundle.main.decode(url: "https://www.hackingwithswift.com/samples/friendface.json")
        FriendsView(user:usus[0])
    }
}
