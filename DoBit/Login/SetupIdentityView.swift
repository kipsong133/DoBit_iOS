//
//  SetupIdentityView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/17.
//

import SwiftUI

struct SetupIdentityView: View {
    @EnvironmentObject var userInfo: RegistrationInfo
    
    var body: some View {
        VStack {
            Text("Hello, World!")
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("\(userInfo.nickname)")
        
    }
}

struct SetupIdentityView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            SetupIdentityView()
                .environmentObject(RegistrationInfo())
        }
    }
}
