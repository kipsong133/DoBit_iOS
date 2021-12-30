//
//  DoCellView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/29.
//

import SwiftUI

struct DoCellView: View {
    @Binding var text: String
    
    let screen = UIScreen.main.bounds
    var hegiht = CGFloat(49)
    var title: String
    
    var body: some View {
        ZStack {
            Color.dobitBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Color.black
                    .frame(width: screen.width, height: 1)
                
                HStack {
                    VStack {
                        Text(title)
                            .bold()
                            .foregroundColor(.dobitBlack)
                            .font(.body)
                            .padding(.leading, 20)
                        Spacer()
                    }
                        
                    VStack {
                        TextField("입력해주세요", text: $text)
                        Spacer()
                    }
                    .padding(.leading, 12)
                }
                
                Color.black
                    .frame(width: screen.width, height: 1)
            }
            
        }.frame(height: hegiht)
    }
}

struct DoCellView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            DoCellView(
                text: .constant(""),
                title: "작은습관")
                .frame(
                    width: UIScreen.main.bounds.width,
                height: 49)
        }
    }
}
