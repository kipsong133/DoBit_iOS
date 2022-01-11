//
//  LoginDetailViewModel.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/11.
//

import Foundation
import Alamofire

enum LoginError {
    case incorrectPassword
    case incorrectEmail
    case empty
    case urlError
    case networkingError
}


class LoginDetailViewModel {
    
    func postLogin(email: String,
                   password: String,
                   completion: @escaping (LoginResponse?, LoginError?) -> Void ) {
        AF.request(LoginRouter.login(email: email,
                                     password: password))
        
            .responseString(completionHandler: { response in
                print("StringResponse: \(response)")
            })
            .responseDecodable(of: LoginResponse.self) { response in
                
                switch response.result {
                case .success(let response):
                    print("Response: \(response)")
                   completion(response, nil)
                    
                    /* 추후에 에러 경우에 따라 enum 케이스로 나눌 예정 22.01.11*/
                case .failure:
                    print("Error: \(response.error?.localizedDescription)")
                    completion(nil, LoginError.networkingError)
                }
            }
    }
}
