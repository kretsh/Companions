//
//  AccessTokenInterface.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 16.04.2023.
//

import Foundation

struct AccessToken: Codable {
    var accessToken: String
    let tokenType: String
    let expiresIn: Int

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
    }
}

