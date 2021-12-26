//
//  RegistrationView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/02.
//

import SwiftUI

struct RegistrationView: View {
    @EnvironmentObject var vm: RegistraionVM
    @Binding var rootIsActive: Bool
    @State var email: String = ""
    @State var password: String = ""
    @State var rePassword: String = ""
    @State var nickname: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    // Check "다음" did tap
    @State var pushView = false
    
    let screenSize = UIScreen.main.bounds
    
    var body: some View {
        Group {
            ZStack {
                Color.dobitBackgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    RegistrationTextField(value: $email, title: "이메일")
                    RegistrationTextField(value: $password, title: "비밀번호")
                    RegistrationTextField(value: $rePassword, title: "비밀번호 확인")
                    RegistrationTextField(value: $nickname, title: "닉네임")
                    Spacer()
                    ProgressImageView(currentPrograssState: 1)
                    VStack {
                        
                        ZStack {
                            // Horizontal borderline
                            Color.black
                                .frame(width: screenSize.width, height: 1, alignment: .center)
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
                                        if vm.showNextView {
                                            pushView = true
                                        } else {
                                            /* Invaildate userInfo */
                                        }
                                    })
                                    }.isDetailLink(false)
                                
                            }
                        }
                    }

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
    var title: String
    let borderWidth = UIScreen.screenWidth
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 25, alignment: .top)
            HStack {
                Spacer()
                    .frame(width: 21,
                           alignment: .leading)
                TextField(title, text: $value)
            }
            
            Divider()
                .frame(width: borderWidth - 42,
                       height: 1,
                       alignment: .center)
                .background(Color.TextFieldBottomLineColor)
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
