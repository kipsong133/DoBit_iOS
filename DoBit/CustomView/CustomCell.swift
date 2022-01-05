//
//  CustomCell.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/05.
//

import SwiftUI

struct CustomCell: View {
    var width: CGFloat = UIScreen.screenWidth
    var height: CGFloat = 50
    
    /* content*/
    let title: String
    let titleColor: Color
    var isContentTitle: Bool = true
    var isTextField: Bool = false
    
    
    
    var body: some View {
        ZStack {
            Color.dobitBackgroundColor
                
            
                
        }
        .frame(width: width, height: height)
    }
}

//struct CustomCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomCell(title: <#String#>, titleColor: <#Color#>)
//            .previewLayout(.sizeThatFits)
//    }
//}
