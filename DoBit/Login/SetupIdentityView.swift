//
//  SetupIdentityView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/17.
//

import SwiftUI

struct SetupIdentityView: View {
    @EnvironmentObject var vm: RegistraionVM
    
    var body: some View {
        ZStack {
            Color.lightBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("어떤 사람이 되고 싶나요?")
                        .padding(.leading, 20)
                    Spacer()
                }
                
                List(0..<20) { _ in
                    IdentityCell(title: .constant("TEST"), isClicked: .constant(true))
                        .listRowInsets(EdgeInsets())
                }
                .listStyle(.plain)

                Spacer()
                    .listRowInsets(EdgeInsets())
            }
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("\(vm.nickname ?? "Nickname")")
        
    }
}

struct SetupIdentityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SetupIdentityView()
                .environmentObject(RegistraionVM())
        }
    }
}
