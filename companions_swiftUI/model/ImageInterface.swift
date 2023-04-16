//
//  ImageInterface.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 16.04.2023.
//

import Foundation

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
