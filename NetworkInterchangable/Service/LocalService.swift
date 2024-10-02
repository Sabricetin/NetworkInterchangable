//
//  LocalService.swift
//  NetworkInterchangable
//
//  Created by Sabri Çetin on 1.10.2024.
//

import Foundation
class LocalService : NetworkService {
    var type: String = "LocalService"
    
    func download (_ resource : String) async throws -> [User] {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resource Not Found")
        }
        let data = try Data(contentsOf: URL(filePath: path))
        return  try JSONDecoder().decode([User].self, from: data)

    }
}
