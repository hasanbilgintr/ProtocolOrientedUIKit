//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by hasan bilgin on 1.12.2023.
//

import Foundation

//UserViewModelProtocol yazılırsa daha iyi olur
//weak var yapılabilirmesi için yapıldı AnyObject extend edildi
protocol UserViewModelOutput : AnyObject{
    //ney iletilmek , aktarılmak istenirse buraya parametere olarak istenir
    func updateView(name : String , email : String , userName : String) 
}
