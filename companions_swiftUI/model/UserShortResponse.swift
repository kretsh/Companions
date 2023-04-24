//
//  UserShort.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 23.04.2023.
//

import Foundation

struct UserShort: Codable, Identifiable{
    var id:             Int
    var name:           String
    var surname:        String
    var nickname:       String
    var images:         ImageGroup
    var displayname:    String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name       = "first_name"
        case surname    = "last_name"
        case nickname   = "login"
        case images     = "image"
        case displayname
    }
}

struct ImageGroup: Codable{
    var versions: ImageRespond
    
    enum CodingKeys: String, CodingKey{
        case versions
    }
}


struct ImageRespond: Codable{
    var small:  URL?
    var large:  URL?
    
    enum ImageKeys: String, CodingKey {
        case small = "small"
        case large = "large"
    }
}
