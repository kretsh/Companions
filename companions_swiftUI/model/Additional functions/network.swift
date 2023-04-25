//
//  network_toDelete.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 12.04.2023.
//

import Foundation

struct networkVariables{
    let urlToken = "https://api.intra.42.fr/oauth/token"
    let urlUser = "https://api.intra.42.fr/v2/users/"
    let parameters: [String:Any]
    init(){
        guard let plistPath = Bundle.main.path(forResource: "Credentials", ofType: "plist") else {
            fatalError("Credentials.plist file not found.")
        }
        guard let plistData = FileManager.default.contents(atPath: plistPath) else {
            fatalError("Unable to load plist file.")
        }
        do {
            let plistDictionary = try PropertyListSerialization.propertyList(from: plistData, options: [], format: nil) as? [String: Any]
            
            // Get the UID and secret values from the Plist dictionary
            guard let uid = plistDictionary?["UID"] as? String, let secret = plistDictionary?["Secret"] as? String else {
                fatalError("UID and/or secret not found in plist file.")
            }
            
            self.parameters = [
                "grant_type": "client_credentials",
                "client_id": uid,
                "client_secret": secret
            ]
            print("UID: \(uid), Secret: \(secret)")
        } catch {
            fatalError("Error loading plist file: \(error)")
        }
    }

}

