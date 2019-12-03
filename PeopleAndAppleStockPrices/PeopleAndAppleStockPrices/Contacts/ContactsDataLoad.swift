//
//  ContactsDataLoad.swift
//  PeopleAndAppleStockPrices
//
//  Created by Maitree Bain on 12/3/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct UserData: Codable {
    let results: [UserInfo]
}

struct UserInfo: Codable {
    let name: Name
    let location: Location
    let email: String
    let picture: Picture
    
}

struct Name: Codable {
    let first: String
    let last: String
}

struct Location: Codable {
    let city: String
}

struct Picture: Codable {
    let medium: String
}

extension UserData {
    
    static func getUsers() -> [UserInfo] {
        var userInfo = [UserInfo]()
        
        guard let fileURL = Bundle.main.url(forResource: "userinfo", withExtension: "json") else {
            fatalError("file not found")
        }
        
        do {
            let data = try Data.init(contentsOf: fileURL)
            
            let userData = try JSONDecoder().decode(UserData.self, from: data)
            userInfo = userData.results
        }
        catch {
            fatalError("error found - \(error)")
        }
        
        return userInfo
    }
}
