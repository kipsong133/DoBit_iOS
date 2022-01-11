//
//  LoginResponse.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/11.
//

import Foundation

struct LoginResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: LoginResponseResult?
}

struct LoginResponseResult: Decodable {
    let userIdx: Int
    let nickname: String
    let jwt: String
}
