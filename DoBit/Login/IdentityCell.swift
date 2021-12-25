//
//  IdentityCell.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/22.
//

import SwiftUI

struct IdentityCell: View {
    var title: String
    @Binding var isChecked: Bool
    let screen = UIScreen.main.bounds

    var body: some View {
        ZStack {
            Color.lightBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text(title)
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                        .padding(.top, 5)
                    
                    Spacer()
                    Image(isChecked ? "capsule.fill" : "capsule.empty")
                        .padding(.trailing, 20)
                        .onTapGesture {
                            isChecked.toggle()
                        }
                    
                }
                
                Color.borderColor
                    .frame(
                        width: screen.width,
                        height: 1,
                        alignment: .center)
            }
        }
        .frame(width: screen.width)
    }
}

struct IdentityTestView: View {
    @State private var isChecked: Bool = false
    
    var body: some View {
        IdentityCell(title: "계획적인 사람", isChecked: $isChecked)
    }
}

struct IdentityCell_Previews: PreviewProvider {
    static var previews: some View {
//        IdentityCell(
//            title: "아침형 인간",
//            isChecked: .constant(true))
        IdentityTestView()
            .frame(width: UIScreen.main.bounds.width,
                   height: 44)
    }
}
