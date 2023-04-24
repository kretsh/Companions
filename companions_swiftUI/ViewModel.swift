//
//  ModelView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 22.04.2023.
//

import SwiftUI
import Alamofire


class ViewModel: ObservableObject {
    private let network = networkVariables()
    private(set) var token: TokenModel?
    
    @Published  var isLoading = true
    @Published  var errorLoading = false
    @Published  var users: [UserShort] = []
    @Published  var selectedUser: UserFull? = nil

    
    init(){
        Alamofire.AF.request(network.urlToken, method: .post, parameters: network.parameters)
            .validate()
            .responseDecodable(of: TokenModel.self) { [weak self] response in
                switch response.result {
                case .success(let tokenResponse):
                    self?.token = tokenResponse
                    self?.token = tokenResponse
                    self?.isLoading = false
                case .failure(_):
                    self?.token = nil
                    self?.errorLoading = true
                }
            }
    }
    


    func usersFetch(login: String) {
        guard let accessToken = self.token else {
            self.errorLoading = true
            return
        }
        

        let parameters = [
            "range[login]": "\(login.lowercased()),\(login.lowercased())z"
        ]
        let headers: HTTPHeaders = ["Authorization": "Bearer \(accessToken.accessToken)"]
        
        Alamofire.AF.request(network.urlUsers, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: [UserShort].self) { [weak self] response in
                guard let self = self else { return }
                switch response.result {
                case .success(let fetchedUsers):
                    print("Uspeshno users")
                    print(fetchedUsers.count)
                    DispatchQueue.main.async {
                        self.users = fetchedUsers
                    }
                case .failure(let error):
                    print(error.acceptableContentTypes)
                    print(String(describing: error))
//                    self.errorLoading = true
                    self.isLoading = false
                }
            }
        }
    
    func userFetch(idOfUser id: Int, completion: @escaping (UserFull) -> Void){
            isLoading = true
            guard let accessToken = self.token else {
                self.errorLoading = true
                return
            }
            let headers:HTTPHeaders = ["Authorization": "Bearer \(String(describing: accessToken.accessToken))"]
            let parameters = ["id": String(id)]
            Alamofire.AF.request(network.urlUser + String(id), method: .get, parameters: parameters, headers: headers)
                .validate()
                .responseDecodable(of: UserFullResponse.self){ [self] response in
                    switch response.result{
                    case .success(let user):
                        var fetchUser: UserFull
                        
                        DispatchQueue.main.async {
                            self.selectedUser = UserFull(userToCopy: user)
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

