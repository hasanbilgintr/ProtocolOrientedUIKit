
// https://jsonplaceholder.typicode.com/users dan aldık
//ile düzenleyip model oluşturuk https://app.quicktype.io
import Foundation



// MARK: - WelcomeElement
struct User: Codable {
    let id: Int
    //sadece 3ünü kullanıcasz yinede yazdık hepsini
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

