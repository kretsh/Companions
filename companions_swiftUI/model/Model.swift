//
//  Model.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 11.04.2023.
//

import Foundation
import Alamofire


class usersModel: ObservableObject {
    private var token: AccessTokenResponse?
    private(set) var users: [User] = []
    private(set) var network = networkVariables()
    @Published var isLoading = true
    @Published var errorLoading: Bool = false
    private static var page: Int = 1
    
    init(){
        Alamofire.AF.request(network.urlToken, method: .post, parameters: network.parameters)
            .validate()
            .responseDecodable(of: AccessTokenResponse.self) { [weak self] response in
                    switch response.result {
                    case .success(let tokenResponse):
                        self?.token = tokenResponse
                        self?.usersFetch()
                    case .failure(_):
                        self?.token = nil
                        self?.errorLoading = true
                    }
            }
    }
    

    private func usersFetch(){
        guard let accessToken = self.token else {
            self.errorLoading = true
            return
        }
        print("Vecher v hatu")
        let parameters = ["page[size]": "100",
                          "page[number]": "\(String(describing: usersModel.page))"]
        let headers: HTTPHeaders = ["Authorization": "Bearer \(String(describing: accessToken.accessToken))"]
        
        Alamofire.AF.request(network.urlUsers, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: [User].self){ [self] response in
                switch response.result {
                case .success(let user):
                    print("Hello there \(usersModel.page)")
//                    self.users.append(contentsOf: user)
                    if usersModel.page == 1{
                        self.users = user
                    } else{
                        self.users.append(contentsOf: user)
                    }
                    usersModel.page += 1
                    if usersModel.page >= 15 || user.count < 100 {
                        self.isLoading = false
                    }
                    if user.count == 100{
                        usersFetch()
                    }

                case .failure(let error):
                    print(error.acceptableContentTypes)
                    print(String(describing: error))
                }
            }
    }
    
}
