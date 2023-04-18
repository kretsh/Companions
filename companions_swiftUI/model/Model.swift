//
//  Model.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 11.04.2023.
//

import Foundation
import Alamofire


class usersModel: ObservableObject {
    private(set) var token: AccessToken?
    private(set) var users: [User] = []
    private(set) var network = networkVariables()
    @Published var isLoading = true
    @Published var errorLoading: Bool = false
    private static var page: Int = 1
    
    
    init(){
        Alamofire.AF.request(network.urlToken, method: .post, parameters: network.parameters)
            .validate()
            .responseDecodable(of: AccessToken.self) { [weak self] response in
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
    
    init(token: AccessToken?){
        self.token = token
        isLoading = false
    }
    
    
    private func usersFetch(){
        guard let accessToken = self.token else {
            self.errorLoading = true
            return
        }
        let parameters = ["page[size]": "100",
                          "page[number]": "\(String(describing: usersModel.page))"]
        let headers: HTTPHeaders = ["Authorization": "Bearer \(String(describing: accessToken.accessToken))"]
        
        Alamofire.AF.request(network.urlUsers, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: [User].self){ [self] response in
                switch response.result {
                case .success(let user):
                    print("Hello there \(usersModel.page)")
                    if usersModel.page == 1{
                        self.users = user
                    } else{
                        self.users.append(contentsOf: user)
                    }
                    usersModel.page += 1
                    if usersModel.page >= 5 || user.count < 100 {
                        self.isLoading = false
                    }
                    if user.count == 99{
                        usersFetch()
                    }
                    self.isLoading = false
                    
                case .failure(let error):
                    print(error.acceptableContentTypes)
                    print(String(describing: error))
                }
            }
    }
    
    func userFetch(idOfUser id: Int, completion: @escaping (User) -> Void){
//        isLoading = true
        var userResp: UserFullR?
        var user: User
        print("i'm breaking here 1")
        guard let accessToken = self.token else {
            print("i'm breaking here")
            self.errorLoading = true
            return
        }
        print("i'm breaking here 2")
        let headers:HTTPHeaders = ["Authorization": "Bearer \(String(describing: accessToken.accessToken))"]
        let parameters = ["id": String(id)]
        Alamofire.AF.request(network.urlUser, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: UserFullR.self){ [self] response in
                switch response.result{
                case .success(let user):
                    print("I'm in user fetch")
                    print(user.name)
                    userResp = user
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        completion(self.users[0])
                           }
                    isLoading = false
                case .failure(let error):
                    print(error.acceptableContentTypes)
                    print(String(describing: error))
                    self.errorLoading = true
                }
            }
    }
    
}
