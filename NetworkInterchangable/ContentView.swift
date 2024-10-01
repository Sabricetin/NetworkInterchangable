//
//  ContentView.swift
//  NetworkInterchangable
//
//  Created by Sabri Çetin on 1.10.2024.
//

import SwiftUI
    

struct ContentView: View {
    
    @ObservedObject var userListViewModel :
    UserListViewModel
    init() {
        self.userListViewModel = UserListViewModel()
    }
    
    var body: some View {
            
      
        List { 
            
            ForEach(Array(userListViewModel.userlist.enumerated()), id: \.offset) { index, user in
                VStack {
                    Text("1 . \(user.name)")
                        .font(.largeTitle)
                        .foregroundColor(.purple)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("2 . \(user.username)")
                        .font(.largeTitle)
                        .foregroundColor(.pink)
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    Text("3 . \(user.email)")
                        .font(.title2)
                        .foregroundColor(.purple)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    Text("4 . \(user.phone)")
                        .font(.title3)
                        .foregroundColor(.pink)
                        .frame(maxWidth: .infinity , alignment: .leading)
                        
                    Text("5 . \(user.website)")
                        .font(.bold(Font.headline)())
                        .foregroundColor(.purple)
                        .frame(maxWidth: .infinity , alignment: .leading)
                        
                }

            } .padding()
             .listRowInsets(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)) // EdgeInsets
                .listRowBackground(Color.clear) // Change Row Color
                .listRowSeparator(.hidden) //hide Seprator
        }  .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.black)
        
        .task {
            await userListViewModel.downloadUSers()
        }
    } 
}

#Preview {
    ContentView()
}
