//
//  MainView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/26.
//

import SwiftUI

struct MainView: View {
    let vm: MainViewVM
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
                        .frame(maxWidth: .infinity,
                               maxHeight: screen.height * (2.0 / 3.0)) // tabbar height 고려
                    Spacer()
                        
                }
            }
            .navigationTitle(nickname)
        }
    } 
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(vm: MainViewVM(),
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
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(Array(zip(vm.identities.indices, vm.identities)), id: \.0) { (index, identity) in
                    MainIdentityRow(identity: identity,
                                    isFirstRow: index == 0 ? true : nil,
                                    isLastRow: index == vm.identities.count-1 ? true : nil)
                }
            }
        }
    }
}
