//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by hasan bilgin on 1.12.2023.
//

import Foundation

class UserViewModel {
    //userViewModelden viewControllere nasıl veriler aktarabiliriz için TEST için DELEGATE yapısını kullanıcaz yani protokol yapıcaz viewmodeldanda erişçez
    
    //weak var demek bu değişken sadece erişildiğinde initializers edilcek tanımlancak yada veri tipi belli olucak diyebiliriz
    //herdeğişkeni weak var yapamayız gerekli gördüğümüz değişkeni yapabiliriz
    //weak var yapılabilirmesi için yapıldı
    //nerde kullanılcaksa [weak self] yazılcaktır uyumlu olmasını sağlamış olur
    weak var output : UserViewModelOutput?
    
    private let userService : UserService
    init(userService: UserService) {
        self.userService = userService
    }
    
    
    
    func fetchUsers() {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
//                print(user)
                //user.name, user.email, user.username bu şekişlde göndermiş olduk
                self?.output?.updateView(name: user.name, email: user.email, userName: user.username)
            case .failure(_):
//                print("error")
                self?.output?.updateView(name: "No user", email:"", userName: "")
            }
        }
    }
}
