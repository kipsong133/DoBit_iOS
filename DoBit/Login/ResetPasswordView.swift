//
//  ResetPasswordView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/26.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var email = String()
    @State private var verificationCode = String()
    @State private var emailErrorMessage = ""
    @State private var codeErrorMessage = ""
    
    let screen = UIScreen.main.bounds
    
    @Environment(\.presentationMode) var presentationMode
    
    private var isErrorInEmail: Bool {
        email.count > 2
    }
    
    private var isErrorInCode: Bool {
        verificationCode.count > 2
    }
    
    var body: some View {
        ZStack {
            /* Background color */
            Color.lightBackgroundColor
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
                    
                    HStack {
                        RegistrationTextField(value: $verificationCode, title: "인증번호", borderWidth: borderwidth / 2.25)
                            .padding(.bottom, 10)
                            
//                            .frame(width: screen.width / 3)
                        
                        Button(action: {
                            /* reset password action */
                        }, label: {
                            HStack {
                                Spacer()
                                Text("인증번호 발송하기")
                                    .bold()
                                    .font(.system(size: 15))
                                    .padding(.trailing, 20)
                                    .padding(.top, 20)
                            }
                        })
                    }
                    
                    
                    if isErrorInCode {
                        AlertMessageLoginInfoView(message: $codeErrorMessage)
                            .offset(y: 50)
                    }
                }

                
                
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
                            text: "다음",
                            isLeftSide: false,
                            action: {
                                // action
                            })
                    }
                }
                
                
            }.padding(.top, 50)
                .foregroundColor(.black)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("비밀번호 재설정")
    }
}

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ResetPasswordView()
        }
    }
}
