//
//  SelectedColor.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/29.
//

import SwiftUI

enum SelectedColor: Int {
    case dobitBeige = 0
    case dobitPink = 1
    case dobitYellow = 2
    case dobitGreen = 3
    case dobitSkyblue = 4
    case dobitBlue = 5
    case dobitPurple = 6
    case dobitBlack = 7
    
    func intToDobitColor(_ index: Int) -> Color {
        switch index {
        case 0:
            return Color.dobitBeige
        case 1:
            return Color.dobitPink
        case 2:
            return Color.dobitYellow
        case 3:
            return Color.dobitGreen
        case 4:
            return Color.dobitSkyblue
        case 5:
            return Color.dobitBlue
        case 6:
            return Color.dobitPurple
        case 7:
            return Color.dobitBlack
        default:
            return Color.dobitBlack
        }
    }
}
