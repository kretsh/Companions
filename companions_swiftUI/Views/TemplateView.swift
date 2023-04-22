//
//  TemplateView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 19.04.2023.
//

import SwiftUI
import SVGKit

struct TemplateView: View {
    let user: UserFull
    
    var body: some View {
        ScrollView{
//             if you gonna use HStack over dont forget HSTack(spacing: )
            AsyncImage(url: user.image.versions.large){ item in
                item
                    .resizable()
                    .frame(maxHeight: 600)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .ignoresSafeArea()
            }placeholder: {
                Image(systemName: "photo.circle")
                    .resizable()
//                    .frame(maxWidth: sizes.maxWidth, maxHeight: sizes.maxHeight, alignment: .leading)
            }
                
            Spacer()
                .frame(height: 0)
            ZStack{
                CoalitionBackroundView()
                VStack(spacing: 0){
                    PersonInformationView(user: user)
                    AvailableView(location: user.location)
                    CustomProgressView(progress: user.level)
                }
            }
            Spacer().frame(height: 0)
            VStack{
                ContactInformationView(user: user)
                ProjectInformationView(user: user)
                
            }
        }
    }
}


struct ProjectInformationView: View{
    let user: UserFull
    
    var body: some View{
        ForEach(user.projects){ project in
            Text(project.project.name)
            
        }
    }
}







struct ContactInformationView: View{
    var user: UserFull
    
    
    var body: some View{
        ZStack{
            Rectangle()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
                .foregroundColor(Color("CustomGrey"))
            
            VStack(alignment: .leading){
                Text("Email: " + user.email)
                    .padding(10)
                    .foregroundColor(Color("CustomBlue"))
                Text("Phone:" + user.phone!)
                    .padding(10)
            }
            .foregroundColor(.white)
            .padding(10)
        }
    }
}



struct CoalitionBackroundView: View{
    var body: some View{
        Image("Fluvius")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}





struct PersonInformationView: View{
    let user: UserFull
    
    let campus:     String
    let wallet:     String
    let evalPoints: String
    let cursus:     String
    let member:     String
    let coalition   = "Castra"
    let map: [String:String]
    
    init(user: UserFull){
        self.user = user
        self.campus = self.user.campus!
        self.wallet = self.user.wallet
        self.evalPoints = self.user.points
        self.cursus = self.user.cursus!
        self.member = self.user.member
        map = ["wallet":wallet, "evalPoints":evalPoints, "cursus":cursus, "member":member,"coalition":coalition]
    }
    
    
    
    var body: some View{
        VStack{
            Text("42"+campus)
                .foregroundColor(Color("CustomBlue"))
                .font(.system(size: 34, weight: .bold , design: .serif))
                .padding(10)
            Text(user.name)
                .font(.system(size: 28, weight: .bold , design: .serif))
                .foregroundColor(.white)
            Text(user.nickname)
                .font(.system(size: 26, weight: .bold , design: .serif))
                .foregroundColor(.white)
        }.padding(50)
        HStack {
            ForEach(map.sorted(by: <), id: \.key) { key, value in
                Spacer()
                    .frame(width: 10)
                VStack {
                    Text(key)
                        .foregroundColor(Color("CustomBlue"))
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
    
    init(progress: Double?) {
        guard let level = progress else{
            let _ = print("Hello world")
            self.level = 0
            self.progress = 0.0
            return
        }
        self.progress = level.truncatingRemainder(dividingBy: 1)
        self.level = Int(level)
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






func getLocation(_ value: String?) -> (String, String){
    switch value{
    case .none:
        return ("Unavailable", "-")
    case .some(let someStr):
        return ("Available", someStr)
    }

}









struct AvailableView: View{
    let firstRow, secondRow: String
    
    init(location: String?){
        let result = getLocation(location)
        firstRow = result.0
        secondRow = result.1
    }
    var body: some View{
        ZStack(){
            Rectangle()
                .padding(10)
                .aspectRatio(3.0/1.3, contentMode: .fit)
                .foregroundColor(Color("CustomGrey"))
            VStack{
                Text(firstRow)
                Text(secondRow)
            }
        }.foregroundColor(.white)
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

//struct TemplateView_Previews: PreviewProvider {
//    static var previews: some View {
//        TemplateView()
////        AvailableView()
////        CustomProgressView(progress: 11.27)
////        PersonInformationView()
//
//    }
//}

