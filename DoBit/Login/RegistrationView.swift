//
//  RegistrationView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/02.
//

import SwiftUI

struct RegistrationView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var rePassword: String = ""
    @State var nickname: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 250, alignment: .top)
                
                RegistrationTextField(value: $email,
                                      title: "이메일")
                RegistrationTextField(value: $password,
                                      title: "비밀번호")
                RegistrationTextField(value: $rePassword,
                                      title: "비밀번호 확인")
                RegistrationTextField(value: $nickname,
                                      title: "닉네임")
                Spacer()
            }
            .ignoresSafeArea()
        .background(Color.dobitBackgroundColor)
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("회원가입")
    }
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView(email: "")
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


