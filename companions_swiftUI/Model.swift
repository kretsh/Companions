//
//  Model.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 11.04.2023.
//

import Foundation
import Alamofire

struct UserResponse: Codable {
    var id:         Int
    var name:       String
    var surname:    String
    var nickname:   String
    var images:     ImagesResponse
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "first_name"
        case surname = "last_name"
        case nickname = "login"
        case images = "image"
    }
}

struct ImagesResponse: Codable{
    var versions:  ImageResponse
    
    enum CodingKeys: String, CodingKey{
        case versions
    }
}


struct ImageResponse: Codable{
    var small:  URL?
    var large:  URL?
    
    enum ImageKeys: String, CodingKey {
        case small = "small"
        case large = "large"
    }
}




class usersModel: ObservableObject {
    private var token: AccessTokenResponse?
    var users: [UserResponse] = []
    let vars = networkVariables()
    @Published var isLoading = true
    
    init(){
        firstConnection()
    }
    
    func firstConnection(){
        Alamofire.AF.request(vars.url, method: .post, parameters: vars.parameters)
            .validate()
            .responseDecodable(of: AccessTokenResponse.self) { [weak self] response in
                    switch response.result {
                    case .success(let tokenResponse):
                        self?.token = tokenResponse
                        self?.usersFetch()
                    case .failure(_):
                        self?.token = nil
                    }
            }
    }
    

    func usersFetch(){
        guard let accessToken = self.token else {
            print("Failed to get token")
            return
        }
        let url = "https://api.intra.42.fr/v2/campus/44/users"
        let parameters = ["page[size]": "100",
                          "page[number]": "1"]

        let headers: HTTPHeaders = ["Authorization": "Bearer \(String(describing: accessToken.accessToken))"]
        
        print(headers)
        Alamofire.AF.request(url, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: [UserResponse].self){ response in
                switch response.result {
                case .success(let user):
                    self.users = user
                    self.isLoading = false
                    print(user[0].images.versions.small)
                    print(user[1].images.versions.small)
                    print(user[2].images.versions.small)
                    print(user[3].images.versions.small)
                    print(user[4].images.versions.small)
                    print(user[5].images.versions.small)
                    print(user[6].images.versions.small)
                    print(user[7].images.versions.small)
                case .failure(let error):
                    print("i'm here")
                    print(error.acceptableContentTypes)
//                    print(error.errorDescription)
                    print(String(describing: error))
                }
            }
        Thread.sleep(forTimeInterval: 3.0)
    }
}
