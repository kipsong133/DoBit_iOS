//
//  RegistrationView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/02.
//

// 22.01.11
// TODO: Email 유효성검사 구현
// TODO: 비밀번호 불일치 및 특정 값이 없을 시, 경고창 출력

/* 이 화면에서 회원가입 API를 호출한다. */

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var vm: RegistraionVM
    @Binding var rootIsActive: Bool
    @State var email: String = ""
    @State var password: String = ""
    @State var rePassword: String = ""
    @State var nickname: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    @State private var errorMessageInEmail: String?
    @State private var errorMessageInPassword: String?
    @State private var errorMessageInNickname: String?
    
    // Check "다음" did tap
    @State var pushView = false
    
    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        Group {
            ZStack {
                Color.dobitBackgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    let borderwidth = CGFloat(screenSize.width - 40)
                    
                    RegistrationTextField(
                        value: $email,
                        error: $errorMessageInEmail,
                        title: "이메일",
                        borderWidth: borderwidth)
                    
                    RegistrationTextField(
                        value: $password,
                        error: $errorMessageInPassword,
                        title: "비밀번호",
                        borderWidth: borderwidth,
                        isSecure: true)
                    
                    RegistrationTextField(
                        value: $rePassword,
                        error: $errorMessageInPassword,
                        title: "비밀번호 확인",
                        borderWidth: borderwidth,
                        isSecure: true)
                    
                    RegistrationTextField(
                        value: $nickname,
                        error: $errorMessageInNickname,
                        title: "닉네임",
                        borderWidth: borderwidth)
                    
                    Spacer()
                    ProgressImageView(currentPrograssState: 1)
                    bottomButtons
                    
                }
            }.navigationTitle("회원가입")
                .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RegistrationView(rootIsActive: .constant(false), email: "")
        }
    }
}

struct RegistrationTitleView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20, alignment: .leading)
            Text("회원가입")
                .font(.system(size: 30, weight: .heavy, design: .default))
            Spacer()
        }
    }
}

struct RegistrationTextField: View {
    
    @Binding var value: String
    @Binding var error: String?
    var title: String
    var borderWidth: CGFloat
    var isSecure: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 25, alignment: .top)
            HStack {
                Spacer()
                    .frame(width: 21,
                           alignment: .leading)
                if isSecure {
                    SecureField(title, text: $value)
                } else {
                    TextField(title, text: $value)
                }
                
            }
            
            Color.TextFieldBottomLineColor
                .frame(width: borderWidth,
                       height: 1,
                       alignment: .leading)
            
            if error != nil {
                HStack {
                    Text(error!)
                        .font(.system(size:12))
                        .foregroundColor(.dobitRed)
                        .padding(.leading, 20)
                    Spacer()
                }
            }
            
        }
    }
}


struct ProgressImageView: View {
    
    var currentPrograssState: Int
    
    var countEmptyImage: Int {
        return 4 - currentPrograssState
    }
    
    var body: some View {
        HStack {
            
            ForEach(1 ..< currentPrograssState + 1) { _ in
                Image("fillBlackDot")
                    .frame(height: 70, alignment: .top)
            }
            
            ForEach(1 ..< countEmptyImage) { _ in
                Image("emptyBlackDot")
                    .frame(height: 70, alignment: .top)
            }
            
        }
    }
}

struct BottomButton: View {
    
    var imageName: String
    var text: String
    var isLeftSide: Bool
    var action: () -> Void
    
    var body: some View {
        Group {
            Button(action: {
                action()
            }, label: {
                VStack {
                    HStack {
                        if isLeftSide {
                            Image(imageName)
                            Text(text)
                            Spacer()
                            
                        } else {
                            Spacer()
                            Text(text)
                            Image(imageName)
                        }
                    }
                    .padding()
                    Spacer()
                        .frame(height: 30)
                }
            })
        }
        .foregroundColor(Color.black)
    }
}

extension RegistrationView {
    private func appearInvaildMessage(_ code: Int,
                                      _ message: String) {
        errorMessageInEmail = nil
        errorMessageInPassword = nil
        errorMessageInNickname = nil
        switch code {
            /* Error in Email */
        case 2020:
            self.errorMessageInEmail = message
        case 2021:
            self.errorMessageInEmail = message
        case 2036:
            self.errorMessageInEmail = message
            
            /* Error in Password */
        case 2035:
            self.errorMessageInPassword = message
        case 2031:
            self.errorMessageInPassword = message
        case 2033:
            self.errorMessageInPassword = message
            
            /* Error in Nickname */
        case 2034:
            self.errorMessageInNickname = message
            
        default:
            break
        }
        
    }
}

extension RegistrationView {
    var bottomButtons: some View {
        VStack {
            
            ZStack {
                // Horizontal borderline
                Color.black
                    .frame(
                        width: screenSize.width,
                        height: 1,
                        alignment: .center)
                    .padding(.bottom, 79)
                
                /* Previous button */
                HStack {
                    BottomButton(imageName: "leftArrow",
                                 text: "이전",
                                 isLeftSide: true,
                                 action: {
                        self.presentationMode.wrappedValue.dismiss()
                    })
                    
                    // Vertical borderline
                    Color.black
                        .frame(width: 1, height: 79, alignment: .center)
                    
                    /* Next button */
                    NavigationLink(
                        destination: SetupIdentityView(shouldPopToRootView: $rootIsActive),
                        isActive: $pushView) {
                            BottomButton(imageName: "rightArrow",
                                         text: "다음",
                                         isLeftSide: false,
                                         action: {
                                // Pass the data to data manager
                                vm.email = email
                                vm.password = password
                                vm.confirmPassword = rePassword
                                vm.nickname = nickname
                                
                                /* Invaildation */
                                vm.postRegistration { response, error in

                                    if error != nil {
                                        pushView = false
                                        return
                                    }
                                    
                                    if let response = response {
                                        if response.isSuccess {
                                            pushView = true
                                        } else {
                                            /* invaild Registration Form */
                                            appearInvaildMessage(
                                                response.code,
                                                response.message)
                                        }
                                    }
                                }
                            })
                        }.isDetailLink(false)
                    
                }
            }
        }
    }
}
