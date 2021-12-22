//
//  UIApplication+Extension.swift
//  DoBit
//
//  Created by 김우성 on 2021/12/06.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
