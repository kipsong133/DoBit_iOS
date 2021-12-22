//
//  RegistrationInfo.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/16.
//

import Foundation

/*
 * Singleton X -> @publish 사용 12.18
 * by Uno
 */
class RegistraionVM: ObservableObject {
    var email: String?
    var password: String?
    var confirmPassword: String?
    @Published var nickname: String?
    var usersIdentities: [Identity] = []
    
    var isCorrectPassword: Bool {
        password == confirmPassword
    }
    
    var showNextView: Bool {
        if email != nil
            && password != nil
            && confirmPassword != nil
            && nickname != nil {
            if password! == confirmPassword! {
                return true
            }
        }
        return false
    }
    
    
    init() { }
}
