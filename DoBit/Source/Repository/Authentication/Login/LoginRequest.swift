//
//  LoginRequest.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/11.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
}
