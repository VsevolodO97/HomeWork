//
//  Extentions.swift
//  TabbleViewProject
//
//  Created by Alexander Kurbatov on 20.03.2022.
//

import UIKit

//MARK: - Enum

enum ColorPallete {
    case backgroundColor
    case textColor
    case iconColor
}

// MARK: - Extention

extension UIColor {
    static func tableColor(_ name: ColorPallete) -> UIColor? {
        switch name {
        case .backgroundColor:
            return UIColor(named: "backgroundColor")
        case .textColor:
            return UIColor(named: "textColor")
        case .iconColor:
            return UIColor(named: "iconColor")
        }
    }
}
