//
//  LoginDetailView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/26.
//

import SwiftUI
import Alamofire

struct LoginDetailView: View {
    let vm = LoginDetailVM()
    @Binding var shouldShowMainView: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var emailErrorMessage: String = ""
    @State private var passwordErrorMessage: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    // Check "비밀번호 재설정" did tap
    @State var pushView = false
    
    let screen = UIScreen.main.bounds
        
    var body: some View {
        ZStack {
            /* Background color */
            Color.dobitBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                let borderwidth = CGFloat(screen.width - 40)
                
                ZStack {
                    RegistrationTextField(value: $email, title: "이메일", borderWidth: borderwidth)
                        .padding(.bottom, 10)
                    if isErrorInEmail {
                        AlertMessageLoginInfoView(message: $emailErrorMessage)
                            .offset(y: 50)
                    }
                }
                
                ZStack {
                    RegistrationTextField(value: $password, title: "비밀번호", borderWidth: borderwidth)
                        .padding(.bottom, 10)
                    
                    if isErrorInPassword {
                        AlertMessageLoginInfoView(message: $passwordErrorMessage)
                            .offset(y: 50)
                    }
                }
                NavigationLink(
                    destination: ResetPasswordView(),
                    isActive: $pushView) {
                        Button(action: {
                            pushView = true
                        }, label: {
                            HStack {
                                Spacer()
                                Text("비밀번호 재설정")
                                    .bold()
                                    .font(.system(size: 15))
                                    .padding(.trailing, 20)
                                    .padding(.top, 20)
                            }
                        })
                    }.isDetailLink(false)

                Spacer()
                
                ZStack {
                    /* Horizontal borderline */
                    Color.black
                        .frame(width: screen.width,
                               height: 1)
                        .padding(.bottom, 79)
                    
                    HStack {
                        BottomButton(
                            imageName: "leftArrow",
                            text: "이전",
                            isLeftSide: true,
                            action: {
                                self.presentationMode.wrappedValue.dismiss()
                            })
                        
                        /* Vertical borderline */
                        Color.black
                            .frame(width: 1, height: 79, alignment: .center)
                        
                        BottomButton(
                            imageName: "rightArrow",
                            text: "시작하기",
                            isLeftSide: false,
                            action: {
                                /* verify email & password */
                                verifyAccount(email: email, password: password) { loginSuccess in
                                    shouldShowMainView = loginSuccess
                                }
                            })
                        
                    }
                }
                
                
            }.padding(.top, 50)
                .foregroundColor(.black)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("로그인")
    }
}

// MARK: - PreView
struct LoginDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginDetailView(shouldShowMainView: .constant(false))
        }
    }
}

// MARK: - After networking API
extension LoginDetailView {
    var isErrorInEmail: Bool {
        emailErrorMessage.count > 2
    }
    
    var isErrorInPassword: Bool {
        passwordErrorMessage.count > 2
    }
    
    /* Login button action */
    func verifyAccount(email: String, password: String, completion: @escaping (Bool) -> Void) {
        vm.postLogin(email: email, password: password) { response, error in
            if let isSuccess = response?.isSuccess {
                if isSuccess {
                    print("LoginDetailView: 로그인 성공")
                } else {
                    print("LoginDetailView: 로그인 실패")
                }
                completion(isSuccess)
            }
            
            if error != nil {
                print("LoginDetailView: 로그인 중 에러 발생")
                completion(false)
            }
        }
    }
}
