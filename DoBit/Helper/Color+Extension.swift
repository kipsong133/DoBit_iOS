//
//  Color+Extension.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/01.
//

import SwiftUI

extension Color {
    
    static let dobitBackgroundColor = Color("DoBitBackgroundColor")
    static let borderColor = Color("BorderColor")
    static let TextFieldBottomLineColor = Color("TextFieldBottomLineColor")
    static let lightBackgroundColor = Color("LightBackgroundColor")
    static let alertRedColor = Color("AlertRedColor")
    static let textGray = Color("TextGray")
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double((rgb >> 0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
