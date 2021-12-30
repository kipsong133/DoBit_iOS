//
//  DoWhenWhereStartCell.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/29.
//

import SwiftUI



struct DoWhenWhereStartCell: View {
    
    var hegiht = CGFloat(49)
    let screen = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Color.dobitBackgroundColor

            
            
            Text("Hello, World!")
        }
        .frame(
            width: screen.width,
            height: hegiht)
        
    }
}

struct DoWhenWhereStartCell_Previews: PreviewProvider {
    static var previews: some View {
        DoWhenWhereStartCell()
    }
}
