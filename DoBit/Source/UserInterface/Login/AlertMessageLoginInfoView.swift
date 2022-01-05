//
//  AlertMessageLoginInfoView.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/26.
//

import SwiftUI

struct AlertMessageLoginInfoView: View {
    
    @Binding var message: String
    
    var body: some View {
        HStack {
            Text(message)
                .font(.footnote)
                .offset(y: -10)
            Spacer()
        }
        .padding(.leading, 20)
            .foregroundColor(.alertRedColor)
    }
}

struct AlertMessageLoginInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AlertMessageLoginInfoView(message: .constant("이메일 주소를 확인해주세요."))
    }
}
