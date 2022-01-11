//
//  RegistrationRequest.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/11.
//

import Foundation

struct RegistrationRequest: Encodable {
    let email: String
    let password: String
    let confirmPassword: String
    let nickname: String
}
