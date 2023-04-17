//
//  accessToken.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 11.04.2023.
//

import Foundation


struct User: Codable, Identifiable{
  
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




