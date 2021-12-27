//
//  TargetIdentityView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/27.
//

import SwiftUI

struct TargetIdentityView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let screen = UIScreen.main.bounds
    
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
        ZStack {
            Color.dobitBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Color.black
                    .frame(width: screen.width, height: 1)
                
                /* First Row */
                Group {
                    HStack {
                        Text("정의")
                            .modifier(TargetIdentityTitleModifier())
                        
                        Text("아침형 인간")
                            .padding(.leading, 15)
                        
                        Spacer()
                    }
                    .frame(height: 50)
                    
                    Color.black
                        .frame(width: screen.width, height: 1)
                }
                
                /* Second Row */
                Group {
                    HStack {
                        Text("Do")
                            .modifier(TargetIdentityTitleModifier())
                        
                        Button(action: {
                            
                        }, label: {
                            Text("아침형 인간")
                        })
                        .padding(.leading, 15)
                        
                        Spacer()
                    }.frame(height: 50)
                    
                    Color.black
                        .frame(width: screen.width, height: 1)
                }
                
                /* Thrid Row */
                Group {
                    HStack {
                        Text("Don't")
                            .modifier(TargetIdentityTitleModifier())
                        
                        Button(action: {
                            
                        }, label: {
                            Text("아침형 인간")
                        })
                        .padding(.leading, 15)
                        
                        Spacer()
                    }.frame(height: 50)
                    
                    Color.black
                        .frame(width: screen.width, height: 1)
                }
                
                /* Fourth Row */
                Group {
                    HStack {
                        Text("Color")
                            .modifier(TargetIdentityTitleModifier())
                        
                        Text("색상들주르륵")
                            .padding(.leading, 15)
                        
                        Spacer()
                    }.frame(height: 50)
                    
                    Color.black
                        .frame(width: screen.width, height: 1)
                }
                
                /* Delete Button */
                Button(action: {
                    
                }, label: {
                    Text("삭제하기")
                })
                
                Spacer()
                
            }
            .padding(.top, 35)
            
            
        }
        .toolbar(content: {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                btnBack
            }
        })
        .navigationTitle("목표 정체성")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TargetIdentityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TargetIdentityView()
        }
    }
}

struct TargetIdentityTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.textGray)
            .font(.body)
            .padding(.leading, 20)
            .padding(.bottom, 30)
    }
}
