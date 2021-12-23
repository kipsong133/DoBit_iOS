//
//  SetupIdentityView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/17.
//

import SwiftUI

struct SetupIdentityView: View {
    @EnvironmentObject var userInfo: RegistraionVM
    
    @State private var identities: [Identity] = allExampleIdentitys
    @State private var isCheckedIndex: [Bool] = Array(repeating: false, count: allExampleIdentitys.count)
    
    @State private  var newIdentity: String = ""
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        
        ZStack {
            Color.lightBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                /* Title Text */
                HStack {
                    Text("어떤 사람이 되고 싶나요?")
                        .padding(.leading, 20)
                    Spacer()
                }
                
                /* Identity List */
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(Array(zip(identities.indices, identities)), id: \.1) { index, identity in
                            IdentityCell(
                                title: identity.name,
                                isChecked: $isCheckedIndex[index])
                        }
                    }
                    
                }
                .border(Color.borderColor, width: 1)
                .frame(height: 240)
                
                HStack {
                    Text("추가하기")
                        .bold()
                        .font(.system(size: 17))
                        .padding(.leading, 20)
                        .padding(.top, 10)
                        .padding(.bottom, 17)
                    Spacer()
                }
                
                VStack {
                    TextField("원하는 목표를 적어주세요", text: $newIdentity)
                        .onSubmit {
                            identities.append(Identity(
                                id: UUID().uuidString,
                                name: newIdentity,
                                isChecked: false))
                            
                            isCheckedIndex.append(false)
                        }
                        .padding(.leading, 20)
                    
                    Color.gray
                        .frame(width: screen.width - 40, height: 1)
                }
                
                
                    
                Spacer()
            }
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("\(userInfo.nickname ?? "Nickname")")
        
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
