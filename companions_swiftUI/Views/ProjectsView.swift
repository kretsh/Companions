//
//  ProjectsView.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 24.04.2023.
//

import SwiftUI


struct ProjectInformationView: View{
    let user: UserFull
    let dateComponentsFormatter = DateComponentsFormatter()
    
    
    
    var body: some View{
        Text("Projects:").frame(maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 18, weight: .bold)).padding(10)
        ScrollView{
            ForEach(user.projects){ project in
                ProjectsView(project: project)
                Spacer().frame(height: 0)
            }
        }
    }
}



struct ProjectsView: View {
    let project: ProjectsUser
    
    var body: some View {
        HStack{
            Text(project.project.name).foregroundColor(Color("CustomBlueDark")).font(.system(size: 16, weight: .bold, design: .serif))
            
            if (project.validated ?? false){
                if (project.validated! == true){
                    Text(Date().offset(from: project.markedAt!))
                    Spacer()
                    Image(systemName: "checkmark").foregroundColor(.green)
                    Text(String(project.finalMark!)).foregroundColor(.green)
                }
            }
            else{
                if let status = project.status?.rawValue, status == "in_progress"{
                    Text(Date().offset(from: project.updatedAt))
                    Spacer()
                    Text("In progress").foregroundColor(.gray)
                }
                else{
                    Text(Date().offset(from: project.updatedAt))
                    Spacer()
                    Image(systemName: "xmark").foregroundColor(.red)
                    Text(String(project.finalMark ?? 0)).foregroundColor(.red)
                }
                
            }
        }.padding(10)
            .font(.system(size: 16, design: .serif))
        
        
    }
}

//struct ProjectsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectsView()
//    }
//}
