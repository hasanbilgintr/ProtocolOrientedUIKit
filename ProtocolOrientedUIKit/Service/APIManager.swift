//
//  APIManager.swift
//  ProtocolOrientedUIKit
//
//  Created by hasan bilgin on 30.11.2023.
//

import Foundation



class APIManager  : UserService {
    
    /*
    //şimdilik singltın yapısını kullandık
    static let shared = APIManager()
    private init () {}
     */
    
    func fetchUser(completion : @escaping(Result<User,Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else{return}
            DispatchQueue.main.async {
                //1 kayıt alması için .first yazdık lastta alınabilirdi
                if let user = try? JSONDecoder().decode([User].self, from: data).first{
                    completion(.success(user))
                }else{
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }
    
}
