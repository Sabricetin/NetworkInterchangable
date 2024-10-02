//
//  NetworkService.swift
//  NetworkInterchangable
//
//  Created by Sabri Çetin on 1.10.2024.
//

import Foundation

protocol NetworkService {
    func download (_ resource : String) async throws -> [User]
    var type : String { get }
}
