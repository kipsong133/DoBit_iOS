//
//  Identiy.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/22.
//

import Foundation
import SwiftUI

struct Identity: Identifiable,Hashable {
    var id = UUID().uuidString
    let userIdentityIdx: Int
    let userIdentityName: String
    let userIdentityColorName: String
    let doHabit: String
    let doNotHabit: String
}
