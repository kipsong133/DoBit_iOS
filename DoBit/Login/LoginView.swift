//
//  LoginView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/01.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 181, alignment: .top)
            LoginTitleView()
            Spacer()
                .frame(minHeight: 300, idealHeight: 336, maxHeight: 390, alignment: .top)
            loginButtonView(buttonName: "회원가입")
            loginButtonView(buttonName: "로그인")
        }
        .ignoresSafeArea()
        .background(Color.dobitBackgroundColor)
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
    
    var body: some View {
        Divider()
            .frame(height: 1, alignment: .center)
            .background(Color.borderColor)
        VStack {
            Spacer()
                .frame(minHeight: 9,
                       maxHeight: 9,
                       alignment: .top)
            HStack {
                Spacer()
                Text(buttonName)
                Image("loginArrow")
                Spacer()
                    .frame(width: 20,
                           alignment: .trailing)
            }
            .frame(height: 79, alignment: .top)
        }
    }
}
