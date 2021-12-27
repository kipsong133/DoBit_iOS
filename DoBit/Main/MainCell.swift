//
//  MainCell.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/27.
//

import SwiftUI

struct MainCell: View {
    @Binding var identity: Identity
    
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.dobitBackgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Color.black
                    .frame(width: screen.width,
                           height: 0.5)
                Spacer()
                
                HStack {
                    Button(action: {
                        identity.isChecked.toggle()
                    }, label: {
                        Image("capsule.fill")
                            .resizable()
                            .frame(width: 22, height: 57)
                            .padding(.leading, 20)
                    })
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(identity.name)
                            .foregroundColor(.black)
                            .font(.title3)
                            .bold()
                        
                        Button(action: {
                            
                        }, label: {
                            Text("습관 추가하기")
                                .font(.callout)
                                .foregroundColor(.gray)
                                
                                
                        })
                    }
                    .padding(.leading, 15)
                    
                    Spacer()
                    
                    Button(action: {
                        //
                    }, label: {
                        Image("loginArrow")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .padding(.trailing, 20)
                            .padding(.bottom, 35)
                    })
                        
                }
                
                
                Spacer()
                Color.black
                    .frame(width: screen.width,
                           height: 0.5)
            }
        }
    }
}

struct MainCell_Previews: PreviewProvider {
    
    static var previews: some View {
        MainCell(identity: .constant(exampleIdentiy1))
            .frame(width: UIScreen.main.bounds.width,
                   height: 81)
    }
}
