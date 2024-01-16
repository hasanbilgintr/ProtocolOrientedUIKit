//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by hasan bilgin on 1.12.2023.
//

import Foundation

//TESTLERDE olabildiğince sahte istek kullanmak isteriz çünkü uzaktan servere biraz uğraştırıcı olarak görürüz ondan herşey //ÖRNEK YAPILCAK //AMAÇ TEST YAZMAK RAHAT ÇALIŞAN
protocol UserService {
    func fetchUser(completion : @escaping(Result<User,Error>) -> Void)
    
    
}
