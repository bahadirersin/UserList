//
//  ContentView.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var users = Users()
    
    var body: some View {
        NavigationView{
            List{
                ForEach(users.users, id:\.id){ user in
                    NavigationLink{
                        FriendDetail(user: user)
                    }label:{
                        HStack{
                            VStack(alignment:.leading){
                                Text("\(user.name)")
                                Text("\(user.email)")
                                    .font(.footnote)
                            }
                            Spacer()
                            Text(user.isActive ? "On" : "Off")
                                .font(.caption)
                                .fontWeight(.black)
                                .padding(8)
                                .foregroundColor(.white)
                                .background(user.isActive ? .green : .gray)
                                .clipShape(Circle())
                                .padding()
                                
                        }
                    }
                }
            }.navigationTitle("Friend Face")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
