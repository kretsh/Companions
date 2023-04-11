//
//  ContentView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 09.04.2023.
//

import Alamofire
import SwiftUI

struct YourDecodableModel: Decodable {
    // properties of your decodable model
}

class DataManager: ObservableObject{
    let url = "https://api.intra.42.fr/oauth/authorize?client_id=u-s4t2ud-d800c91cbb36a2ebc8ab518f6e38cd498dd754513312a9ce565dac0cd3207d9c&redirect_uri=https%3A%2F%2Fwww.google.com%2F&response_type=code"
    let headers: HTTPHeaders = [
        "UID": "u-s4t2ud-d800c91cbb36a2ebc8ab518f6e38cd498dd754513312a9ce565dac0cd3207d9c",
        "Secret": "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"]
    
    func fetchData(){
        AF.request(url, headers: headers).responseDecodable(of: YourDecodableModel.self) { response in
            switch response.result {
            case .success(let result):
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}


struct BackgroundView: View{
    var body: some View{
            Image("Fluvius")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}


struct ContentView: View {
    var SearchUI = SearchView()
    var backgroundUI = BackgroundView()
    
    @StateObject var dataManager = DataManager()

    var body: some View {
        ZStack{
            backgroundUI
            VStack{
                Image("42_logo").resizable().frame(width: 150, height: 150)
                Image("Background_full")
                SearchUI
            }
        }
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

