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
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "first_name"
        case surname = "last_name"
        case nickname = "login"
    }
}



class usersModel {
    private var token: AccessTokenResponse?
    var users: [UserResponse] = []

    init(){
        let vars = networkVariables()
        
        Alamofire.AF.request(vars.url, method: .post, parameters: vars.parameters)
            .validate()
            .responseDecodable(of: AccessTokenResponse.self) { [weak self] response in
                    switch response.result {
                    case .success(let tokenResponse):
                        self?.token = tokenResponse
//                        self?.token?.HTTPHeaders = ["Authorization": "Bearer \(String(describing: tokenResponse.accessToken))"]
                        print(self?.token?.accessToken)
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
        let url = "https://api.intra.42.fr/v2/cursus/42/users"
        let parameters = ["page[size]": "100",
                          "page[number]": "1"]

        let headers: HTTPHeaders = ["Authorization": "Bearer \(String(describing: accessToken.accessToken))"]
        
        print(headers)
        Alamofire.AF.request(url, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: [UserResponse].self){ response in
                switch response.result {
                case .success(let user):
                    self.users.append(contentsOf: user)
                case .failure(let error):
                    print("i'm here")
                    print(error.acceptableContentTypes)
//                    print(error.errorDescription)
                    print(String(describing: error))
                }
            }
    }
}
