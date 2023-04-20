//
//  TemplateView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 19.04.2023.
//

import SwiftUI

struct TemplateView: View {
    var body: some View {
        ScrollView{
            // if you gonna use HStack over dont forget HSTack(spacing: )
//            Image("large_cowen")
//                .resizable()
//                .frame(maxHeight: 600)
//                .ignoresSafeArea()
            Spacer()
                .frame(height: 0)
            ZStack{
                Image("Fluvius")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                VStack(spacing: 0){
                    PersonInformationView()
                    AvailableView()
                    CustomProgressView(progress: 11.30)
                    
                }
            }
        }
    }
}








struct PersonInformationView: View{
    let wallet      = "1000"
    let evalPoints  = "100"
    let cursus      = "42Cursus"
    let member      = "Student"
    let coalition   = "Castra"
    let map: [String:String]
    
    init(){
        map = ["wallet":wallet, "evalPoints":evalPoints, "cursus":cursus, "member":member,"coalition":coalition]
    }
    
    
    
    var body: some View{
        VStack{
            Text("42 Wolfsburg")
                .foregroundColor(Color("CustomBlue"))
                .font(.system(size: 34, weight: .bold , design: .serif))
                .padding(10)
            Text("Paul Krätsch")
                .font(.system(size: 28, weight: .bold , design: .serif))
                .foregroundColor(.white)
            Text("cowen")
                .font(.system(size: 26, weight: .bold , design: .serif))
                .foregroundColor(.white)
        }
        HStack {
            ForEach(map.sorted(by: <), id: \.key) { key, value in
                Spacer()
                    .frame(width: 10)
                VStack {
                    Text(key)
                    Spacer()
                        .frame(height: 10)
                    Text(value)
                }
                .font(.system(size: 12, weight: .bold , design: .serif))
                .foregroundColor(.white)
            }
        }
    }
}




struct CustomProgressView: View{
    
    let level: Int
    @State private var progress: Double
    
    init(progress: Double) {
        self.progress = progress.truncatingRemainder(dividingBy: 1)
        self.level = Int(progress)
    }
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 0.75)
                .padding(10)
                .frame(height: 75)
                .foregroundColor(Color("CustomGrey"))
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 0.75)
                    .padding(10)
                    .frame(width: 20 + progress * 400, height: 75)
                    .foregroundColor(Color("CustomBlue"))
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            ZStack{
                Text("level \(level) - \(progress)%")
                    .foregroundColor(.white)
            }
        }
        
    }
    
}
















struct AvailableView: View{
    var avaliable: Bool = false
    
    enum online: String{
        case online = "Available"
        case offline = "Unavailable"
    }
    
    
    var body: some View{
        ZStack(){
            Rectangle()
                .padding(10)
                .aspectRatio(3.0/1.3, contentMode: .fit)
                .foregroundColor(Color("CustomGrey"))
            VStack{
                Text(online.offline.rawValue)
                Spacer()
                    .frame(height: 15)
                Text("-")
            }
                .foregroundColor(.white)
        }
    }
}



//struct TemplateView: View {
//    var body: some View {
//        ZStack{
//            BackgroundView()
//            VStack{
//                HStack{
//                    Image("large_cowen")
//                        .resizable()
//                        .clipShape(Circle())
//                        .scaledToFill()
//                        .frame(maxWidth: 120, maxHeight: 200, alignment: .leading)
//                    //                                        .background(Color(.red))
//                    VStack{
//                        Text("Pedro Pablo Vilchez Carrasqussasdasdasdaero")
////                            .background(Color(.blue))
//                            .foregroundColor(.white)
//                            .frame(maxWidth: .infinity, alignment: .topTrailing)
//                            .font(.system(size: 30))
//                            .padding(5)
//                        HStack{
//                            Text("Trophy")
//                            Text("1000")
//                            //                        }.foregroundColor(.white)
//                        }
//                        .frame(maxWidth: .infinity)
//                        //                                    .background(Color(.purple))
//
//
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    //                            .background(Color(.green))
//                }
//            }
//        }
//    }
//}

struct TemplateView_Previews: PreviewProvider {
    static var previews: some View {
        TemplateView()
//        AvailableView()
//        CustomProgressView(progress: 11.27)
//        PersonInformationView()
        
    }
}

