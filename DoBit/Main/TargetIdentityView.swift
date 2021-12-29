//
//  TargetIdentityView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/27.
//

import SwiftUI

struct TargetIdentityView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @Binding var identity: Identity
    @State var selectedColorIndex: Int = 8
    
    var colors = Color.dobitColors
    @State private var isSelectedColors: [Bool] = Array<Bool>(repeating: false, count: Color.dobitColors.count)
    
    let screen = UIScreen.main.bounds
    
    @State var pushView = false
    
    var btnBack : some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                HStack {
                Image("leftArrow")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                }
            }
        }
    
    
    var body: some View {

        return ZStack {
            Color.dobitBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Color.black
                    .frame(width: screen.width, height: 1)
                
                /* "정의" First Row */
                TargetIdentityCell(
                    title: "정의",
                    text: $identity.name).onAppear {
                        print("DEBUG: Traget에서 value \(identity.name)")
                    }
                
                
                
                NavigationLink(
                    destination: DoView(),
                    isActive: $pushView, label: {
                        VStack {
                            BehaviorCell(title: "Do",
                                         behaviorName: identity.doList?.first ?? "", pushView: $pushView)
                        }
                    })
                    
                
                /* "Do" Second Row */
//                BehaviorCell(title: "Do",
//                             behaviorName: identity.doList?.first ?? "")
                
                /* "Don't" Thrid Row */
                BehaviorCell(title: "Don't",
                             behaviorName: identity.dontList?.first ?? "", pushView: $pushView)
                
                /* "Color" Fourth Row */
                ColorPickerView(
                    colors: colors,
                    isSelectedColors: $isSelectedColors,
                    selectedColorIndex: $selectedColorIndex)
                
                /* Delete Button */
                Button(action: {
                    // Action
                }, label: {
                    HStack {
                        Spacer()
                        Text("삭제하기")
                            .padding(.trailing, 20)
                            .padding(.top, 25)
                    }
                })
                
                Spacer()
                
            }
            .foregroundColor(.black)
            .padding(.top, 35)
            
            
        }
        .toolbar(content: {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                btnBack
            }
        })
        .navigationTitle("목표 정체성")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct TargetIdentityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TargetIdentityView(identity: .constant(exampleIdentiy1))
        }
    }
}

struct TargetIdentityTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.textGray)
            .font(.body)
            .padding(.leading, 20)
        
    }
}



struct TargetIdentityCell: View {
    var title: String
    let screen = UIScreen.main.bounds
    @Binding var text: String
    
    var body: some View {
        Group {
            HStack {
                VStack {
                    Text(title)
                        .bold()
                        .modifier(TargetIdentityTitleModifier())
                        .padding(.top, 5)
                    
                    Spacer()
                }
                
                VStack {
                    TextField(title, text: $text)
                        .font(.system(size: 20, weight: .medium))
                        .padding(.top, 5)
                        .padding(.leading, 17)
                    Spacer()
                }
                Spacer()
            }
            .frame(height: 50)
            
            Color.black
                .frame(width: screen.width, height: 1)
        }
    }
}

struct BehaviorCell: View {
    let screen = UIScreen.main.bounds
    let title: String
    let behaviorName: String
    @Binding var pushView: Bool
    
    var body: some View {
        Group {
            HStack {
                VStack {
                    Text(title)
                        .modifier(TargetIdentityTitleModifier())
                        .padding(.top, 5)
                    Spacer()
                }
                
                Button(action: {
                    pushView = true
                }, label: {
                    HStack {
                        VStack {
                            Text(behaviorName)
                                .font(.system(size: 20, weight: .medium))
                                .padding(.top , 5)
                                .padding(.leading, 27)
                            Spacer()
                        }
                        Spacer()
                        
                        VStack {
                            Image("rightArrow")
                                .padding(.top , 5)
                                .padding(.trailing, 20)
                            Spacer()
                        }
                    }
                })
                Spacer()
            }.frame(height: 50)
            
            Color.black
                .frame(width: screen.width, height: 1)
        }
    }
}
