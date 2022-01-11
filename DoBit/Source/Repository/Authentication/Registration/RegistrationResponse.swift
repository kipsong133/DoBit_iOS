//
//  RegistrationResponse.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/11.
//

import Foundation

struct RegistrationResponse: Decodable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let result: RegistrationResult?
}

struct RegistrationResult: Decodable {
    let userIdx: Int
    let jwt: String
}
