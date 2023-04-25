//
//  Interfaces2.swift
//  companions_swiftUI
//
//  Created by PAUL KRETSH on 19.04.2023.
//

import Foundation

class UserFull: Identifiable{
    
    
    var id: UUID
    var name: String
    var location: String?
    var image: URL?
    var campus: String
    var nickname: String
    var wallet: String
    var points: String
    var cursus: CursusUser?
    var member: String
    var level: Double?
    var phone: String?
    var email: String
    var projects: [ProjectsUser]
    
    
    init(userToCopy rhs: UserFullResponse) {
        // done
        self.id = UUID()
        self.name = rhs.displayname
        self.nickname = rhs.login
        self.location = rhs.location
        switch(rhs.image.versions.large){
        case nil:
            self.image = nil
        case (.some(let value)):
            self.image = value
        }
        
        for cursusUser in rhs.cursusUsers{
            let cursus = cursusUser.cursus
            self.cursus = cursusUser
            self.level = cursusUser.level
            if cursus.name.contains("42cursus"){
                break
            }
        }
        self.campus = rhs.campus.last!.name
        self.wallet = String(rhs.wallet)
        self.points = String(rhs.correctionPoint)
        self.member = rhs.kind
        self.email = rhs.email
        self.phone = rhs.phone
        self.projects = rhs.projectsUsers.filter{ item in item.status!.rawValue == "finished"}
        self.projects = rhs.projectsUsers
        
       
    }
}


