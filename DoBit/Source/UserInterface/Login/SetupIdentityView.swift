//
//  SetupIdentityView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/17.
//

import SwiftUI

struct SetupIdentityView: View {
    @EnvironmentObject var userInfo: RegistraionVM
    @Binding var shouldPopToRootView: Bool
    @State private var identities: [Identity] = allExampleIdentitys
    @State private var isCheckedIndex: [Bool] = Array(repeating: false, count: allExampleIdentitys.count)
    
    @State private  var newIdentity: String = ""
    @State var pushView = false
    @Environment(\.presentationMode) var presentationMode

    let screen = UIScreen.main.bounds
    
    func getCheckedIdentities(_ checkedArr: [Bool]) -> [Identity] {
        var checkedIdentities = [Identity]()
        for (index, item) in checkedArr.enumerated() {
            if item == true {
                checkedIdentities.append(identities[index])
            }
        }
        return checkedIdentities
    }
    
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
                ScrollView(.vertical,
                           showsIndicators: false) {
                    LazyVStack {
                        ForEach(Array(zip(identities.indices, identities)), id: \.1) { index, identity in
                            IdentityCell(
                                title: identity.userIdentityName,
                                isChecked: $isCheckedIndex[index])
                        }
                    }
                }
                .border(Color.borderColor, width: 1)
                .frame(height: 240)
                
                /* Append New Identity*/
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
//                            identities.append()
                            
                            isCheckedIndex.append(true)
                        }
                        .padding(.leading, 20)
                    
                    Color.gray
                        .frame(width: screen.width - 40, height: 1)
                }
                
                Spacer()
                
                
                let isCheckAnything = isCheckedIndex.filter { $0 == true }
                let userIsChecked: Bool = isCheckAnything.first != nil
                /* if there is checked Identity, true */
                if userIsChecked {
                    ProgressImageView(currentPrograssState: 3)
                        .offset(y: 45)
                } else {
                    ProgressImageView(currentPrograssState: 2)
                        .offset(y: 45)
                }
                
                ZStack {
                    /* Horizontal borderline */
                    Color.black
                        .frame(width: screen.width, height: 1, alignment: .center)
                        .padding(.bottom, 79)
                    
                    /* Previous button */
                    HStack {
                        BottomButton(imageName: "leftArrow",
                                     text: "이전",
                                     isLeftSide: true,
                                     action: {
                            self.presentationMode.wrappedValue.dismiss()
                        })
                        
                        /* Vertical borderline */
                        Color.black
                            .frame(width: 1, height: 79, alignment: .center)
                        
                        /* Next button */
                        BottomButton(imageName: "rightArrow",
                                     text: "다음",
                                     isLeftSide: false,
                                     action: {
                            /* Invaildation */
                            if userIsChecked {
                                userInfo.usersIdentities = getCheckedIdentities(isCheckedIndex)
                                shouldPopToRootView = false
                            } else {
                                shouldPopToRootView = true
                            }
                        })
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarHidden(false)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("\(userInfo.nickname ?? "Nickname")")
        
    }
}

struct SetupIdentityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SetupIdentityView(shouldPopToRootView: .constant(false))
                .environmentObject(RegistraionVM())
        }
    }
}
