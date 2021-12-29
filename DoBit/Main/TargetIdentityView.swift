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
                Group {
                    HStack {
                        VStack {
                            Text("정의")
                                .modifier(TargetIdentityTitleModifier())
                                .padding(.top, 5)
                            
                            Spacer()
                        }
                        
                        VStack {
                            TextField("정의", text: $identity.name)
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
                
                /* "Do" Second Row */
                Group {
                    HStack {
                        VStack {
                            Text("Do")
                                .modifier(TargetIdentityTitleModifier())
                                .padding(.top, 5)
                            Spacer()
                        }
                        
                        Button(action: {
                            // action
                        }, label: {
                            HStack {
                                VStack {
                                    Text("아침형 인간")
                                        .padding(.top , 5)
                                        .padding(.leading, 27)
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        Spacer()
                    }.frame(height: 50)
                    
                    Color.black
                        .frame(width: screen.width, height: 1)
                }
                
                /* "Don't" Thrid Row */
                Group {
                    HStack {
                        VStack {
                            Text("Don't")
                                .modifier(TargetIdentityTitleModifier())
                                .padding(.top, 5)
                            Spacer()
                        }

                        Button(action: {
                            
                        }, label: {
                            HStack {
                                VStack {
                                    Text("아침형 인간")
                                        .padding(.top , 5)
                                        .padding(.leading, 10)
                                    Spacer()
                                }
                                Spacer()
                            }
                        })
                        
                        Spacer()
                    }.frame(height: 50)
                    
                    Color.black
                        .frame(width: screen.width, height: 1)
                }
                
                /* "Color" Fourth Row */
                ColorPickerView(
                    colors: colors,
                    isSelectedColors: $isSelectedColors,
                    selectedColorIndex: $selectedColorIndex)
                
                /* Delete Button */
                Button(action: {
                    
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


