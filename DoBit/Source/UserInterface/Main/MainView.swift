//
//  MainView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/26.
//

import SwiftUI

struct MainView: View {
    let mainViewVM: MainViewVM
    @State private var nickname: String = "Uno"
    @Binding var rootIsActive: Bool
    @State private var selectedIdentityIndex: Int? = nil
    @State private var navigationViewIsActive: Bool = false
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        NavigationView {
            ZStack {
                background
                
                /* List */
                VStack(spacing: 0) {
                    blackBorder
                    identityList
                    blackBorder
                    Spacer()
                        
                }
            }
            .navigationTitle(nickname)
        }
    } 
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(mainViewVM: MainViewVM(),
                 rootIsActive: .constant(false))
    }
}


fileprivate extension MainView {
    var background: some View {
        Color.dobitBackgroundColor
            .edgesIgnoringSafeArea(.all)
    }
    
    var blackBorder: some View {
        Color.black
            .frame(width: screen.width, height: 1)
    }
    
    var identityList: some View {
        Text("asdf")
    }
}
