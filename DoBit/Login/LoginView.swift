//
//  LoginView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/01.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                    .frame(height: 181, alignment: .top)
                LoginTitleView()
                Spacer()
                    .frame(minHeight: 300, idealHeight: 336, maxHeight: 390, alignment: .top)
                Group {
                    Divider()
                        .frame(height: 1, alignment: .center)
                        .background(Color.borderColor)
                    NavigationLink(destination: RegistrationView()) {
                        loginButtonView(buttonName: "회원가입")
                            .contentShape(Rectangle())
                    }
                }
                
                Group {
                    Divider()
                        .frame(height: 1, alignment: .center)
                        .background(Color.borderColor)
                    NavigationLink(destination: RegistrationView()) {
                        loginButtonView(buttonName: "로그인")
                            .contentShape(Rectangle())
                    }
                }
            }
            .ignoresSafeArea()
        .background(Color.dobitBackgroundColor)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct LoginTitleView: View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 20, height: nil, alignment: .leading)
            Text("Do Habit,\nDo Bit.")
                .font(.system(size: 70, weight: .bold, design: .default))
                .lineLimit(2)
            Spacer()
        }
    }
}

struct loginButtonView: View {
    
    var buttonName: String
    let width = UIScreen.screenWidth
    
    var body: some View {
        Group {
            VStack {
                Spacer()
                    .frame(minHeight: 9,
                           maxHeight: 9,
                           alignment: .top)
                HStack {
                    Spacer()
                    Text(buttonName)
                        .frame(width: width - 40,
                               height: 79,
                               alignment: .topTrailing)
                        .foregroundColor(Color.black)
                    Image("loginArrow")
                        .frame(height: 70, alignment: .top)
                    Spacer()
                        .frame(width: 20,
                               alignment: .trailing)
                }
                
            }
        }
    }
}
