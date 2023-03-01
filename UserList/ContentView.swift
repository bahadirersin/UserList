//
//  ContentView.swift
//  UserList
//
//  Created by Bahadır Ersin on 28.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var fetchedUsers = Users()
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.isActive, order: .reverse),
        SortDescriptor(\.name)]) var users:FetchedResults<CachedUser>
    @State private var firstAppear:Bool = true
    @State private var testCount = 0
    
    var body: some View {
        NavigationView{
            List{
                ForEach(users, id:\.id){ user in
                    NavigationLink{
                        FriendDetail(user: user)
                    }label:{
                        HStack{
                            VStack(alignment:.leading){
                                Text("\(user.wrappedName)")
                                Text("\(user.wrappedEmail)")
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
            .onAppear{
                print("--> On Appear called")
                if(firstAppear){
                    fillLocalDB()
                    firstAppear=false
                    testCount += 1
                    print("This is the \(testCount). run")
                }
            }
        }
    }
    
    func fillLocalDB(){
        for user in fetchedUsers.fetchedUsers{
            let cachedUser = CachedUser(context:moc)
            cachedUser.id = user.id
            cachedUser.name = user.name
            cachedUser.email = user.email
            cachedUser.tags = user.tags.joined(separator:",")
            cachedUser.about = user.about
            cachedUser.company = user.company
            cachedUser.isActive = user.isActive
            cachedUser.age = Int16(user.age)
            cachedUser.address = user.address
        
            var friendArray:[CachedFriend] = []
            
            for friend in user.friends{
                let cachedFriend = CachedFriend(context: moc)
                cachedFriend.name = friend.name
                cachedFriend.id = friend.id
                friendArray.append(cachedFriend)
            }
            
            cachedUser.friend = NSSet.init(array: friendArray)
            if moc.hasChanges{
                try? moc.save()
            }
        }
    }
}
