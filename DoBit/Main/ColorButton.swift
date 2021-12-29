//
//  ColorButton.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/29.
//

import SwiftUI

struct ColorButton: View {
    @Binding var isSelected: Bool
    var color: Color
    var width: CGFloat = 16
    var height: CGFloat = 30
    
    var body: some View {
        ZStack {
            Image("capsule.template")
                .foregroundColor(color)
                .frame(width: width, height: height)
            if isSelected {
                Image("CapsuleBorderImage")
            }
            
        }
    }
}

struct ColorButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorButton(isSelected: .constant(true), color: .dobitYellow)
            .frame(width: 16, height: 30)
    }
}
