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
        self.identities.append(Identity(name: "아침형인간"))
        self.identities.append(Identity(name: "계획적인 사람"))
        self.identities.append(Identity(name: "공부를 즐기는 사람"))
        self.identities.append(Identity(name: "건강한 사람"))
        self.identities.append(Identity(name: "다이어트에 성공한 사람"))
        self.identities.append(Identity(name: "제2외국어에 능숙한 사람"))
    }
}
