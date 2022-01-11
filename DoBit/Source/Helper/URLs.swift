//
//  URLs.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/09.
//

import Foundation
import Alamofire

struct URLs {
    public static let baseURL = URL(string: "https://lilyhome.shop")
}

public protocol APIRoutable: URLRequestConvertible {
    
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: String]? { get }
}

extension APIRoutable {
    var baseURL: URL { return URLs.baseURL! }
    var token: String { return "" }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch method {
        case .get:
            request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        case .post:
            request = try JSONParameterEncoder().encode(parameters, into: request)
        default:
            request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
        }
        
        request.setValue(token, forHTTPHeaderField: "token")
        return request
    }
}
