//
//  RegistrationInfo.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/16.
//

import Foundation
import Alamofire

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
            
            if password == "" { return false }
            if confirmPassword == "" { return false }
            
            if password! == confirmPassword! {
                return true
            }
        }
        return false
    }
    
    func postRegistration(
        completion: @escaping (RegistrationResponse?, Error?) -> Void) {
        
        guard showNextView != false else { return }
        
        AF.request(RegistrationRouter.registrationUser(
            email: email!,
            password: password!,
            confirmPassword: confirmPassword!,
            nickname: nickname!))
            .responseDecodable(of: RegistrationResponse.self) { response in
                
                switch response.result {
                case .success(let response):
                    if let jwtToken = response.result?.jwt,
                       let userIndex = response.result?.userIdx {
                        Constant.shared.jwt = jwtToken
                        Constant.shared.userIdx = userIndex
                    }
                    completion(response, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
    
    init() { }
}
