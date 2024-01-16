//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by hasan bilgin on 30.11.2023.
//

import XCTest
@testable import ProtocolOrientedUIKit

//UnitTesttir
final class ProtocolOrientedUIKitTests: XCTestCase {
    
    //bölede kullanımı var system under Test açılımı düşünebiliriz
    //private var sut : UserViewModel
    //! ler ise testlerde initializers olmadığı için koyduk
    private var userViewModel : UserViewModel!
    private var userService : MockUserService!
    private var output :MockUserViewModelOutput!
    
    //bu arada testlerin içinde initializers yapılmadığı için illa fonksiyon içinde yapılması gerekiyor
    //testler daha başlamadan
    override func setUpWithError() throws {
        
        userService = MockUserService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        //userViewModel her output ürettiğinde bizim yaptığımız outputa eşitlemiş olucaz
        userViewModel.output = output
    }
    
    //testler bitince
    override func tearDownWithError() throws {
        //bunları yapmnaya gerek yok ama profesyonel projelerde var
        userService = nil
        userViewModel = nil
        output = nil
    }
    
    //APİ varmış gibi yani ona mock(taklit) gibi yapıcaz
    //UpdateViewFonksiyonunu test ediyoruz.Nezaman API Success olunca.Ne yapıyor APISucces olunca Email,name,username leri gösteriyor demektir
    func testUpdateView_whenAPISuccess_showEmailNameUserName() throws {
        let mockUser = User(id: 1, name: "Atil", username: "atilsamancioglu", email: "atil@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        //oluşturduğumuzu verdik
        userService.fetchUserMockResult = .success(mockUser)
        //gerçek çalıştırdık
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.userName1, "atilsamancioglu")
    }
    
    //UpdateViewFonksiyonunu test ediyoruz.Nezaman API Failure olunca.Ne yapıyor API Failure olunca No User gösteriyor demektir
    func testUpdateView_whenAPIFailure_showNoUser() throws {
        userService.fetchUserMockResult = .failure(NSError())
        userViewModel.fetchUsers()
        
        //No user tam yazılması lazım
        XCTAssertEqual(output.updateViewArray.first?.name1, "No user")
    }
    
    
    
}

//bu şekilde istediğimiz veriyi verebilceğimiz için nete gerek klamıcak daha hızlı olucak vs....
class MockUserService : UserService {
    var fetchUserMockResult : Result<ProtocolOrientedUIKit.User, Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOrientedUIKit.User, Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
    
    
}

//taklit buda
class MockUserViewModelOutput : UserViewModelOutput {
    var updateViewArray : [(name1 : String , email1 : String , userName1 : String)] = []
    func updateView(name: String, email: String, userName: String) {
        updateViewArray.append((name,email,userName))
    }
    
    
}

