//
//  RouterProtocol.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/11.
//

import Foundation
import Alamofire

protocol Router: URLRequestConvertible {
    var jwt: String? { get }
    var baseURL: URL { get }
    var path: String { get }
    var header: HTTPHeaders { get }
    var method: HTTPMethod { get }
    var parameters: [String: String] { get }
}

extension Router {
    var jwt: String? {
        if let token = Constant.shared.jwt {
            return token
        } else {
            return nil
        }
    }
    
    var baseURL: URL {
        URL(string: "https://lilyhome.shop")!
    }
    
    func asURLRequest() throws -> URLRequest {
        // 2 baseURL + path
        let url = baseURL.appendingPathComponent(path)
        // 3 URLRequest 객체 생성
        var request = URLRequest(url: url)
        // 4 method 선택
        request.method = method
        
        // 5 Header 추가
        request.headers = header
        
        // 6 URL-encoded / JSONParameter 로 부호화
        switch method {
        case .get:
            request = try URLEncodedFormParameterEncoder(destination: .methodDependent)
                .encode(parameters,into: request)
        case .post:
            // Post
            request = try JSONParameterEncoder.default.encode(parameters, into: request)
        default:
            request = try URLEncodedFormParameterEncoder(destination: .methodDependent)
                .encode(parameters,into: request)
            
        }
        // 6 URLRequest 객체 리턴
        return request
    }
}
