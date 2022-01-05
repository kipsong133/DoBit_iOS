//
//  LoginView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/01.
//

import SwiftUI

struct LoginView: View {
    @StateObject var userInfo = RegistraionVM()
    @State private var isActive: Bool = false
    @Binding var shouldShowMainView: Bool
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        NavigationView {
            VStack {
                titleView
                Spacer()
                Group {
                    NavigationLink(
                        destination: RegistrationView(rootIsActive: $isActive),
                        isActive: $isActive) {
                            LoginRow(title: "회원가입")
                        }
                        .isDetailLink(false)
                }
                
                Group {
                    NavigationLink(
                        destination: LoginDetailView(
                            shouldShowMainView: $shouldShowMainView)) {
                                LoginRow(title: "로그인")
                            }
                }
            }
            .background(Color.dobitBackgroundColor)
            .edgesIgnoringSafeArea(.bottom)
        }
        .environmentObject(userInfo)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(shouldShowMainView: .constant(false))
    }
}

fileprivate extension LoginView {
    var background: some View {
        Color.dobitBackgroundColor
            .edgesIgnoringSafeArea(.all)
    }
    
    var titleView: some View {
        HStack {
            Spacer()
                .frame(width: 20, height: nil, alignment: .leading)
            Text("Do Habit,\nDo Bit.")
                .font(.system(size: 70, weight: .bold, design: .default))
                .lineLimit(2)
            Spacer()
        }
    }
    
    var borderLine: some View {
        Color.borderColor
            .frame(width: screen.width, height: 1)
    }
}

struct LoginRow: View {
    let screen = UIScreen.main.bounds
    let title: String
    
    var body: some View {
        VStack {
            borderLine
            HStack {
                Spacer()
                Text(title)
                    .font(.system(size: 18)).fontWeight(.medium)
                    
                Image("loginArrow")
                    .padding(.trailing, 20)
            }
            .foregroundColor(.dobitBlack)
            Spacer()
        }
        .frame(width: screen.width,
               height: 80)
    }
    
    var borderLine: some View {
        Color.borderColor
            .frame(width: screen.width, height: 1)
    }
}
