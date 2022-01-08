//
//  Identiy.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/22.
//

import Foundation
import SwiftUI

struct Identity {
    var id = UUID().uuidString
    let userIdentityIdx: Int
    let userIdentityName: String
    let userIdentityColorName: String
    let doHabit: String
    let doNotHabit: String
}

extension Identity : Identifiable {}
extension Identity : Hashable {}

extension Identity {
    var color: Color {
        switch userIdentityColorName {
        case "doBitBlack":
            return .dobitBlack
        default:
            return .dobitBlack
        }
    }
}

