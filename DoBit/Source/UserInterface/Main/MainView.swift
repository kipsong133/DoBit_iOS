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
                        .frame(
                            maxWidth: .infinity,
                            maxHeight: screen.height - 50)
                    Spacer()
                    blackBorder
                }
                
                VStack {
                    Spacer()
                    Button(action: {
                        // action
                    }, label: {
                        addButtonImage
                    })
                        .foregroundColor(.dobitBlack)
                }
                .padding(.bottom, 50)
                .padding(.trailing, 20)
            }
            .foregroundColor(.dobitBlack)
            .navigationTitle(nickname)
        }
    } 
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(vm: MainViewVM())
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
                    
                    NavigationLink {
                        UpdateIdentityView(identity: identity)
                    } label: {
                        MainIdentityRow(
                            color: identity.color,
                            identity: identity,
                            isFirstRow: index == 0 ? true : nil,
                            isLastRow: index == vm.identities.count-1 ? true : nil)
                    }

                }
            }
        }
    }
    
    var backgroundImagePlusButton: some View {
        Image("plusbuttonBackgroundImage")
            .resizable()
            .scaledToFit()
            .frame(height: 65)
    }
    
    var addButtonImage: some View {
        HStack {
            Spacer()
            ZStack {
                backgroundImagePlusButton
            Image(systemName: "plus")
                    .imageScale(.medium)
            }
        }
    }
}
