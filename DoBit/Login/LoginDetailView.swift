//
//  LoginDetailView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/26.
//

import SwiftUI

struct LoginDetailView: View {
    @Binding var shouldShowMainView: Bool
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var emailErrorMessage: String = ""
    @State private var passwordErrorMessage: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var isErrorInEmail: Bool {
        emailErrorMessage.count > 2
    }
    
    var isErrorInPassword: Bool {
        passwordErrorMessage.count > 2
    }
    
    let screen = UIScreen.main.bounds
    
    /* temp method */
    func verifyAccount(email: String, password: String) -> Bool {
        if email == "uno" && password == "1234" {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        ZStack {
            /* Background color */
            Color.lightBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                ZStack {
                    RegistrationTextField(value: $email, title: "이메일")
                        .padding(.bottom, 10)
                    if isErrorInEmail {
                        AlertMessageLoginInfoView(message: $emailErrorMessage)
                            .offset(y: 50)
                    }
                }
                
                ZStack {
                    RegistrationTextField(value: $password, title: "비밀번호")
                        .padding(.bottom, 10)
                    
                    if isErrorInPassword {
                        AlertMessageLoginInfoView(message: $passwordErrorMessage)
                            .offset(y: 50)
                    }
                }


                Button(action: {
                    /* reset password action */
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
                                if verifyAccount(email: email, password: password) {
                                    shouldShowMainView = true
                                } else {
                                    /* show alert message */
                                    emailErrorMessage = "이메일 주소를 확인해주세요."
                                    passwordErrorMessage = "비밀번호를 확인해주세요."
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

struct LoginDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginDetailView(shouldShowMainView: .constant(false))
        }
    }
}
