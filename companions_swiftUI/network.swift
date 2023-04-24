//
//  network_toDelete.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 12.04.2023.
//

import Foundation

struct networkVariables{
    static let uid = "u-s4t2ud-d800c91cbb36a2ebc8ab518f6e38cd498dd754513312a9ce565dac0cd3207d9c"
//    static let secret: String? = nil
    static let secret = "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"
    let urlToken = "https://api.intra.42.fr/oauth/token"
    let urlUsers = "https://api.intra.42.fr/v2/users/"
    let urlUser = "https://api.intra.42.fr/v2/users/"
    let urlImageAch = "https://cdn.intra.42.fr/achievement/image/"
    
    
    let parameters: [String: Any] = [
        "grant_type": "client_credentials",
        "client_id": uid,
        "client_secret": secret
    ]
}

