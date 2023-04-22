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
    var image: UserFullResponseImage
    var campus: String?
    var nickname: String
    var wallet: String
    var points: String
    var cursus: String?
    var member: String
    var level: Double?
    var phone: String?
    var email: String
    var projects: [ProjectsUser]
    
    
    init(userToCopy rhs: UserFullResponse) {
        //        self.name = rhs.name
        self.id = UUID()
//        self.images = rhs.image
        self.name = rhs.displayname
        self.nickname = rhs.login
        self.location = rhs.location
        self.image = rhs.image
        self.campus = rhs.campus.last?.name
        self.wallet = String(rhs.wallet)
        self.points = String(rhs.correctionPoint)
//        self.cursus = rhs.cursusUsers.filter{item in item.cursus.name.localizedStandardContains("42Cursus") || item.cursus.name.localizedStandardContains("42Cursus")}
        self.cursus = rhs.cursusUsers[1].cursus.name
        self.member = rhs.kind
        self.level = rhs.cursusUsers[1].level
        self.email = rhs.email
        self.phone = rhs.phone
        self.projects = rhs.projectsUsers
        
        
    }
}


// MARK: - UserFullResponse
struct UserFullResponse: Codable {
    let email, login, displayname, kind: String
    let image: UserFullResponseImage
    let phone: String?
    let staff: Bool?
    let correctionPoint: Int
    let poolMonth, poolYear: String
    let location: String?
    let wallet: Int
    let alumnizedAt: String?
    let alumni, active: Bool
    let cursusUsers: [CursusUser]
    let projectsUsers: [ProjectsUser]
    let achievements: [Achievement]
    let campus: [Campus]

    enum CodingKeys: String, CodingKey {
        case email, login, displayname, kind, image
        case staff = "staff"
        case correctionPoint = "correction_point"
        case poolMonth = "pool_month"
        case poolYear = "pool_year"
        case location, wallet
        case alumnizedAt = "alumnized_at"
        case alumni = "alumni?"
        case active = "active?"
        case cursusUsers = "cursus_users"
        case projectsUsers = "projects_users"
        case achievements
        case campus
        case phone
    }
}

// MARK: - Campus
struct Campus: Codable {
    let id: Int
    let name, timeZone: String
    let language: Language
    let usersCount, vogsphereID: Int
    let country, address, zip, city: String
    let website: String
    let facebook, twitter: String
    let active, campusPublic: Bool
    let emailExtension: String
    let defaultHiddenPhone: Bool
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case timeZone = "time_zone"
        case language
        case usersCount = "users_count"
        case vogsphereID = "vogsphere_id"
        case country, address, zip, city, website, facebook, twitter, active
        case campusPublic = "public"
        case emailExtension = "email_extension"
        case defaultHiddenPhone = "default_hidden_phone"
    }
}

// MARK: - Language
struct Language: Codable {
    let id: Int
    let name, identifier, createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, name, identifier
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
    
// MARK: - Achievement
struct Achievement: Codable, Identifiable {
    let id: Int
    let name, description: String
    let tier: Tier
    let kind: Kind
    let visible: Bool
    let image: String
    let nbrOfSuccess: Int?
    let usersURL: String

    enum CodingKeys: String, CodingKey {
        case id, name, description, tier, kind, visible, image
        case nbrOfSuccess = "nbr_of_success"
        case usersURL = "users_url"
    }
}

enum Kind: String, Codable {
    case pedagogy = "pedagogy"
    case project = "project"
    case scolarity = "scolarity"
    case social = "social"
}

enum Tier: String, Codable {
    case challenge = "challenge"
    case easy = "easy"
    case hard = "hard"
    case medium = "medium"
    case none = "none"
}

// MARK: - CursusUser
struct CursusUser: Codable {
    let grade: String?
    let level: Double
    let skills: [Skill]
    let blackholedAt: String?
    let id: Int
    let beginAt: String
    let endAt: String?
    let cursusID: Int
    let hasCoalition: Bool
    let createdAt, updatedAt: String
    let cursus: Cursus
    let user: User?

    enum CodingKeys: String, CodingKey {
        case grade, level, skills
        case blackholedAt = "blackholed_at"
        case id
        case beginAt = "begin_at"
        case endAt = "end_at"
        case cursusID = "cursus_id"
        case hasCoalition = "has_coalition"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case cursus, user
    }
}

// MARK: - Cursus
struct Cursus: Codable {
    let id: Int
    let createdAt, name, slug, kind: String

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case name, slug, kind
    }
}

// MARK: - Skill
struct Skill: Codable {
    let id: Int
    let name: String
    let level: Double
}


// MARK: - UserImage
struct UserImage: Codable {
    let link: String?
    let versions: PurpleVersions
}

// MARK: - PurpleVersions
struct PurpleVersions: Codable {
    let large, medium, small, micro: String?
}

// MARK: - UserFullResponseImage
struct UserFullResponseImage: Codable {
    let link: String?
    let versions: FluffyVersions
}

// MARK: - FluffyVersions
struct FluffyVersions: Codable {
    let large, small: URL?
}

// MARK: - ProjectsUser
struct ProjectsUser: Codable, Identifiable {
    let id, occurrence: Int
    let finalMark: Int?
    let status: Status
    let validated: Bool?
    let currentTeamID: Int?
    let project: Project
    let cursusIDS: [Int]
    let markedAt: String?
    let marked: Bool
    let retriableAt: String?
    let createdAt, updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id, occurrence
        case finalMark = "final_mark"
        case status
        case validated = "validated?"
        case currentTeamID = "current_team_id"
        case project
        case cursusIDS = "cursus_ids"
        case markedAt = "marked_at"
        case marked
        case retriableAt = "retriable_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Project
struct Project: Codable {
    let id: Int
    let name, slug: String
    let parentID: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case parentID = "parent_id"
    }
}

enum Status: String, Codable {
    case finished = "finished"
    case inProgress = "in_progress"
    case parent = "parent"
    case searchingAGroup = "searching_a_group"
}
