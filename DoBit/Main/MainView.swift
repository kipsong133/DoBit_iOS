//
//  MainView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/26.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViweVM()
    @State private var nickname: String = "Uno"
    @Binding var rootIsActive: Bool
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                Color.dobitBackgroundColor
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 0) {
                    
                    Color.black
                        .frame(width: screen.width, height: 1)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack(spacing: 0) {
                            ForEach(vm.identites.indices, id: \.self) { index in
                                NavigationLink(
                                    isActive: $rootIsActive,
                                    destination: {
                                        TargetIdentityView(identity: $vm.identites[index])
                                    }, label: {
                                        MainCell(identity: $vm.identites[index])
                                            .frame(height: 81)
                                    })
                            }
                        }
                    }
                    .frame(maxHeight: screen.height - 250)
                    Color.black
                        .frame(width: screen.width, height: 1)
                    
                    Spacer()
                        
                }
            }
            .navigationTitle(nickname)
        }
    } 
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(rootIsActive: .constant(false))
    }
}
