//
//  BorderlineView.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/09.
//

import SwiftUI

struct BorderlineView: View {
    let width: CGFloat = UIScreen.main.bounds.width
    let color: Color = .black
    
    var body: some View {
        color
            .frame(width: width, height: 1)
    }
}

struct BorderlineView_Previews: PreviewProvider {
    static var previews: some View {
        BorderlineView()
    }
}
