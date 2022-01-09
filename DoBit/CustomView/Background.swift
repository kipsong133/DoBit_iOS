//
//  BackGround.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/22.
//

import SwiftUI

struct Background<Content: View>: View {
    private var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Color.white
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .overlay(content)
    }
}


//
//struct BackGround_Previews: PreviewProvider {
//    static var previews: some View {
//        Background(content: <#() -> _#>)
//    }
//}
