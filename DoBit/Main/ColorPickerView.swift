//
//  ColorPickerView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/29.
//

import SwiftUI

struct ColorPickerView: View {
    let screen = UIScreen.main.bounds
    var colors: [Color]
    @Binding var isSelectedColors: [Bool]
    @Binding var selectedColorIndex: Int
    
    var body: some View {
        VStack {
            Group {
                HStack {
                    VStack {
                        Text("Color")
                            .modifier(TargetIdentityTitleModifier())
                            .padding(.top , 5)
                        Spacer()
                    }
                    
                    HStack(spacing: 15) {
                        ForEach(colors.indices, id: \.self) { index in
                            let color = colors[index]
                            Button(action: {
                                
                            }, label: {
                                ColorButton(
                                    isSelected: $isSelectedColors[index],
                                    color: color,
                                    width: 22,
                                    height: 35)
                                    .onTapGesture {
                                        // resetting isSelected Color
                                        isSelectedColors = Array<Bool>(repeating: false, count: Color.dobitColors.count)
                                        // change Image selected color
                                        selectedColorIndex = index
                                        isSelectedColors[index].toggle()
                                    }
                            })
                        }
                    }
                    .padding(.leading, 15)
                    
                    Spacer()
                }.frame(height: 50)
                
                
            }
            Color.black
                .frame(width: screen.width, height: 1)
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(
            colors: Color.dobitColors,
            isSelectedColors: .constant(Array<Bool>(repeating: false, count: Color.dobitColors.count)),
            selectedColorIndex: .constant(7))
    }
}
