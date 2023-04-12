//
//  network_toDelete.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 12.04.2023.
//

import Foundation

struct networkVariables{
    static let uid = "u-s4t2ud-d800c91cbb36a2ebc8ab518f6e38cd498dd754513312a9ce565dac0cd3207d9c"
    static let secret = "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"
    let url = "https://api.intra.42.fr/oauth/token"
    
    
    let parameters: [String: Any] = [
        "grant_type": "client_credentials",
        "client_id": uid,
        "client_secret": secret
    ]
}

struct AccessTokenResponse: Codable {
    var accessToken: String
    let tokenType: String
    let expiresIn: Int
//    var HTTPHeaders: HTTPHeaders?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
    }
}
