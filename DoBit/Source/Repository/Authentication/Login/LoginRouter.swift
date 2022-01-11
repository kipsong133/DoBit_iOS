//
//  LoginRepository.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/11.
//

import Alamofire
import SwiftUI

protocol Router { }


enum LoginRouter: Router {
    case login(email: String, password: String)
    case autoLogin
    
    var  baseURL: URL {
        URL(string: "https://lilyhome.shop")!
    }
    
    var path: String {
        switch self {
        case .login:
            return "/users/login"
        case .autoLogin:
            return "/users/login"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .autoLogin:
            return .post
        }
    }
    
    var header: HTTPHeaders {
        return HTTPHeaders(["Content-Type" : "application/json"])
    }
    
    var parameters: [String: String] {
        switch self {
        case let .login(email: email, password: password):
            return ["email": email,
                    "password": password]
        case .autoLogin:
            return [:]
        }
    }
}

// 1 URLRequestConvertible 채택
extension LoginRouter: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        // 2 baseURL + path
        let url = baseURL.appendingPathComponent(path)
        // 3 URLRequest 객체 생성
        var request = URLRequest(url: url)
        // 4 method 선택
        request.method = method
        // 5 URL-encoded 로 부호화
//        request = try URLEncodedFormParameterEncoder(destination: .methodDependent)
//            .encode(parameters,into: request)
        request = try JSONParameterEncoder.default.encode(parameters, into: request)
    
        request.headers = header
        
        // 6 URLRequest 객체 리턴
        return request
    }
}
