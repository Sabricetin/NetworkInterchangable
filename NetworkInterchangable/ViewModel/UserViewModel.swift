//
//  UserViewModel.swift
//  NetworkInterchangable
//
//  Created by Sabri Çetin on 1.10.2024.
//

import Foundation

class UserListViewModel : ObservableObject {
    
    @Published var  userlist = [UserViewModel] ()
    
   // let webservice = WebService()
    
    private var service : NetworkService
    init(service : NetworkService) {
        self.service = service
    }
    func downloadUSers() async{
        
        var resource = ""
        if service.type == "Webservice" {
            resource = Constants.Urls.usersExtension
        } else {
            resource = Constants.Paths.baseUrl
        }
        do {
            let users = try await service.download(resource)
            DispatchQueue.main.async {
                self.userlist = users.map(UserViewModel.init)
            }
        } catch {
            print(error)
        }
    }
}
struct  UserViewModel   {
    
    let user : User
    
    var id :Int {
        user.id
    }
    var name : String {
        user.name
    }
    var username : String {
        user.username
    }
    var email : String {
        user.email
    }
    var address : Address {
        user.address
    }
    var phone : String {
        user.phone
    }
    var website : String {
        user.website
    }
}
