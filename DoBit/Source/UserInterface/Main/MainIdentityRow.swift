//
//  MainIdentityRow.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/08.
//

import SwiftUI

struct MainIdentityRow: View {
    var identity: Identity
    var isFirstRow: Bool?
    var isLastRow: Bool?
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                
                if isFirstRow != nil {
                    blackBorder
                        .offset(y: -1)
                }
                
                Spacer()
                HStack {
                    Image("capsule.template")
                        .resizable()
                        .scaledToFit()
                        .frame(height: proxy.size.height * 0.7)
                        .padding(.leading, 20)
                    
                    VStack(alignment: .leading) {
                        Spacer()
                        Text(identity.userIdentityName)
                            .font(.system(size: 18))
                            .bold()
                            .foregroundColor(.dobitBlack)
                        Spacer()
                        Text(identity.doHabit)
                            .font(.system(size: 14))
                            .font(.body)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.leading, 15)
                    
                    Spacer()
                    
                    VStack {
                        Image("loginArrow")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 19)
                            .padding(.trailing, 20)
                            .padding(.top, 5)
                        Spacer()
                    }
                    
                }
                Spacer()
                
                if isLastRow != nil {
                    blackBorder
                        .offset(y: 1)
                } else {
                    blackBorder
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 81)
    }
}

struct MainIdentityRow_Previews: PreviewProvider {
    static var previews: some View {
        MainIdentityRow(identity: exampleIdentiy1)
            .previewLayout(.sizeThatFits)
    }
}

fileprivate extension MainIdentityRow {
    var blackBorder: some View {
        Color.black
            .frame(width: UIScreen.main.bounds.width, height: 1)
    }
}
