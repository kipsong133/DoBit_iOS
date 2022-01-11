//
//  SetupIdentityVM.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/23.
//

import SwiftUI

class SetupIdentityVM: ObservableObject {
    @Published var identities: [Identity] = []
    
    var count: Int {
        return identities.count
    }
    
    init() {
        self.setupDefatulIdentities()
    }
    
    func setupDefatulIdentities() {
    }
}
