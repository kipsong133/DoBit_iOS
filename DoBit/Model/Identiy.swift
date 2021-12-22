//
//  Identiy.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/22.
//

import Foundation
import SwiftUI

struct Identity: Identifiable {
    var id = UUID().uuidString
    let name: String
}
