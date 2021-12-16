//
//  RegistrationInfo.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/16.
//

import Foundation

class RegistrationInfo {
    static let shread = RegistrationInfo()
    
    var email: String = "DEFAULT"
    var password: String = "DEFAULT"
    var confirmPassword: String = "DEFAULT"
    var nickname: String = "DEFAULT"
    
    var isCorrectPassword: Bool {
        password == confirmPassword
    }
    
    
    private init() { }
}
