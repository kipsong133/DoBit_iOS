//
//  RegistrationRouter.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/11.
//

import Foundation
import Alamofire

enum RegistrationRouter: Router {
    case registrationUser(
        email: String,
        password: String,
        confirmPassword: String,
        nickname: String)
    
    var path: String {
        switch self {
        case .registrationUser:
            return "/users/signup"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .registrationUser:
            return .post
        }
    }
    
    var header: HTTPHeaders {
        return HTTPHeaders(["Content-Type" : "application/json"])
    }
    
    var parameters: [String: String] {
        switch self {
        case let .registrationUser(
            email: email,
            password: password,
            confirmPassword: confirmPassword,
            nickname: nickname):
            return ["email": email,
                    "password": password,
                    "confirmPassword":confirmPassword,
                    "nickname": nickname]
        }
    }
}

