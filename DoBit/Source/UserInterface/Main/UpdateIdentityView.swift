//
//  UpdateIdentityView.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/08.
//

import SwiftUI

struct UpdateIdentityView: View {
    @Environment(\.presentationMode) var mode
    let identity: Identity
    let screen = UIScreen.main.bounds
    let identityColors: [Color] = [
        .dobitBeige, .dobitPink, .dobitRed, .dobitYellow, .dobitGreen, .dobitSkyblue, .dobitBlue, .dobitPurple, .dobitBlack
    ]
    @State private var selectedColorIndex: Int = 7
    
    @State private var definitionText: String = ""
    var rowHeight = CGFloat(51)
    
    var body: some View {
        ZStack {
            Color.dobitBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                BorderlineView()
                    .padding(.top, 37)
                
                Group {
                    definitionCell
                    BorderlineView()
                }
                
                Group {
                    doCell
                    BorderlineView()
                }
                
                
                Group {
                    dontCell
                    BorderlineView()
                }
                
                Group {
                    colorCell
                    BorderlineView()
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }) {
                    Image("backButtonIcon")
                }
            }
            
            ToolbarItem(placement: .principal) {
                Text("목표 정체성")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // check action
                }) {
                    Image("checkIcon")
                }
            }
        }
    }
}

struct UpdateIdentityView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UpdateIdentityView(identity: exampleIdentiy1)
        }
    }
}

fileprivate extension UpdateIdentityView {
    var definitionCell: some View {
        VStack {
            HStack {
                Text("정의")
                    .lightGraySetting()
                Spacer()
                TextField("정의", text: $definitionText)
                    .font(.system(size: 18, weight: .medium))
                    .frame(idealWidth: screen.width * 0.7)
                    .fixedSize()
                    .onAppear {
                        definitionText = identity.userIdentityName
                    }
                Spacer()
            }
            .padding(.top, 5)
            Spacer()
        }
        .padding(.leading, 20)
        .frame(height: rowHeight)
    }
    
    var doCell: some View {
        NavigationLink(destination: { DoView() }, label: {
            VStack {
                HStack {
                    Text("Do")
                        .lightGraySetting()
                    Spacer()
                    Text(identity.doHabit)
                        .frame(maxWidth: screen.width * 0.6, alignment: .leading)
                        
                    Spacer()
                    Image("rightArrow")
                        .padding(.trailing, 20)
                }
                .padding(.top, 5)
                Spacer()
            }
            .foregroundColor(.dobitBlack)
            .padding(.leading, 20)
            .frame(height: rowHeight)
        })
    }
    
    var dontCell: some View {
        NavigationLink(destination: { DontView() }, label: {
            VStack {
                HStack {
                    Text("Don't")
                        .lightGraySetting()
                    Spacer()
                    Text(identity.doNotHabit)
                        .frame(maxWidth: screen.width * 0.65, alignment: .leading)
                        
                    Spacer()
                    Image("rightArrow")
                        .padding(.trailing, 20)
                }
                .padding(.top, 5)
                Spacer()
            }
            .foregroundColor(.dobitBlack)
            .padding(.leading, 20)
            .frame(height: rowHeight)
        })

    }
    
    var colorCell: some View {
        VStack {
            HStack {
                Text("Color")
                    .lightGraySetting()
                Spacer()
                
                HStack(spacing: 15) {
                    ForEach(Array(zip(identityColors.indices, identityColors)), id: \.1, content: { (index, color) in
                        ZStack {
                            if index == selectedColorIndex {
                                Image("CapsuleBorderImage")
                                    .resizable()
                                    .scaledToFit()
                            }
                            
                            
                            Image("capsule.template")
                                .resizable()
                                .foregroundColor(color)
                                .scaledToFit()
                                .padding(3)
                                .onTapGesture {
                                    selectedColorIndex = index
                                }
                            
                        }
                    })
                }
                Spacer()
            }
            .padding(.top, 5)
            Spacer()
        }
        .foregroundColor(.dobitBlack)
        .padding(.leading, 20)
        .frame(height: rowHeight)
    }
    
    
}


struct LightGrayModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(.textGray)
    }
}

extension View {
    func lightGraySetting() -> some View {
        modifier(LightGrayModifier())
    }
}
