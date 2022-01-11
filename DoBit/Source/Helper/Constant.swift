//
//  Constant.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/02.
//

import UIKit

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

class Constant {
    static let shared = Constant()
    
    var jwt: String?
    var userIdx: Int?
    
    private init() { }
}
