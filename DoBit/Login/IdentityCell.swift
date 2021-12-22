//
//  IdentityCell.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/22.
//

import SwiftUI

struct IdentityCell: View {
    @Binding var title: String
    @Binding var isClicked: Bool
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
                    Image(isClicked ? "capsule.fill" : "capsule.empty")
                        .padding(.trailing, 20)
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

struct IdentityCell_Previews: PreviewProvider {
    static var previews: some View {
        IdentityCell(
            title: .constant("아침형 인간"),
            isClicked: .constant(false))
            .frame(width: UIScreen.main.bounds.width,
                   height: 44)
    }
}
