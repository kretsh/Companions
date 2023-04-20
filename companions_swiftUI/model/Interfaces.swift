import Foundation

//// MARK: - UserFullResponse
//struct UserFullResponse: Codable {
//    let id: Int
//    let login, usualFullName, displayname, kind: String
//    let image: Images
//    let correctionPoint: Int
//    let poolMonth, poolYear: String
//    let location: String?
//    let wallet: Int
//    let cursusUsers: [CursusUser]
////    let projectsUsers, achievements, titlesUsers: [JSONAny]
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case login
//        case usualFullName = "usual_full_name"
//        case displayname, kind, image
//        case correctionPoint = "correction_point"
//        case poolMonth = "pool_month"
//        case poolYear = "pool_year"
//        case location
//        case wallet
//        case cursusUsers = "cursus_users"
////        case projectsUsers = "projects_users"
////        case achievements
////        case titlesUsers = "titles_users"
//    }
//}
//
//// MARK: - CursusUser
//struct CursusUser: Codable {
//    let id: Int
//    let beginAt: String
//    let level: Double
//    let skills: [[String:String]]
//    let cursusID: Int
//    let hasCoalition: Bool
////    let user: User
////    let cursus: Cursus
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case beginAt = "begin_at"
//        case level
//        case skills
//        case cursusID = "cursus_id"
//        case hasCoalition = "has_coalition"
////        case user
////        case cursus
//    }
//}
//
//// MARK: - Cursus
//struct Cursus: Codable {
//    let id: Int
//    let createdAt, name, slug: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case createdAt = "created_at"
//        case name, slug
//    }
//}
//
//// MARK: - User
//struct Users: Codable {
//    let id: Int
//    let login: String
//    let url: String
//}
//
//// MARK: - Images
//struct Images: Codable {
//    let versions: Versions
//}
//
//// MARK: - Versions
//struct Versions: Codable {
//    let large, small: String
//}
//


