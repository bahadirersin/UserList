//
//  FriendDetail.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//

import SwiftUI

struct FriendDetail: View {
    
    let user:CachedUser
    
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                
                Group{
                    HStack{
                        Text("Email:")
                            .fontWeight(.bold)
                            .font(.subheadline)
                        Text(user.wrappedEmail)
                            .font(.subheadline)
                    }
                    
                    HStack{
                        Text("Age:")
                            .fontWeight(.bold)
                            .font(.subheadline)
                        Text("\(user.age)")
                            .font(.subheadline)
                    }
                    
                    HStack{
                        Text("Company Name:")
                            .fontWeight(.bold)
                            .font(.subheadline)
                        Text(user.wrappedCompany)
                            .font(.subheadline)
                    }
                    
                    HStack(alignment:.top){
                        Text("Address:")
                            .fontWeight(.bold)
                            .font(.subheadline)
                        Text(user.wrappedAddress)
                            .font(.subheadline)
                    }
                }
                
                Divider()
                
                VStack(alignment:.leading){
                    Text("About:")
                        .fontWeight(.bold)
                        .font(.subheadline)
                    Text(user.wrappedAbout)
                        .font(.subheadline)
                }.padding(.top,5)

                Divider()
                
                VStack(alignment:.leading){
                    Text("Skills:")
                        .fontWeight(.bold)
                        .font(.subheadline)
                    TagList(user: user)
                }.padding(.top,5)

                Divider()
                
                VStack(alignment:.leading){
                    Text("Friends:")
                        .fontWeight(.bold)
                        .font(.subheadline)
                    FriendsView(user: user)
                }.padding(.top,5)
                
                
            }
            .padding(.horizontal)
            .padding(.top,30)
            .navigationTitle(user.wrappedName)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

