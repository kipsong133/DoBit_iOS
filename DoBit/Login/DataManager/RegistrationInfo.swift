//
//  RegistrationInfo.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/16.
//

import Foundation

class RegistrationInfo: ObservableObject {
    var email: String = "DEFAULT"
    var password: String = "DEFAULT"
    var confirmPassword: String = "DEFAULT"
    @Published var nickname: String = "DEFAULT"
    
    var isCorrectPassword: Bool {
        password == confirmPassword
    }
    
    init() { }
}
