//
//  UpdateIdentityView.swift
//  DoBit
//
//  Created by 김우성 on 2022/01/08.
//

import SwiftUI

struct UpdateIdentityView: View {
    let identity: Identity
    
    var body: some View {
        Text(identity.userIdentityName)
    }
}

struct UpdateIdentityView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateIdentityView(identity: exampleIdentiy1)
    }
}
