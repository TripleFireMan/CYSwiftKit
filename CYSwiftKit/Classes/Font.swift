//
//  Font.swift
//  MasterConverge
//
//  Created by MiTu on 2020/6/17.
//  Copyright © 2020 刘金丰. All rights reserved.
//

import Foundation
import UIKit

public enum MCFontCategory {
    public enum typeface: String {
        /// 极细
        case Ultralight = "Ultralight"
        
        /// 纤细
        case Thin       = "Thin"
        
        /// 细体
        case Light      = "Light"
        
        /// 常规
        case Regular    = "Regular"
        
        /// 中黑
        case Medium     = "Medium"

        /// 中粗
        case Semibold   = "Semibold"
    }
    
    case PingFangSC(_ size: Int = 14, _ type: typeface = .Regular)
    case SimSun(_ size: Int = 14)
}

public extension MCFontCategory {
    func fontName() -> (name: String, size: Int) {
        var name = ""
        var fontSize = 0
        switch self {
        case .PingFangSC(let size, let type):
            name = "PingFang-SC-" + type.rawValue
            fontSize = size
        case .SimSun(let size):
            name = "SimSun"
            fontSize = size
        }
        return (name, fontSize)
    }
}

public func MCFont(_ cat: MCFontCategory) -> UIFont {
    let val = cat.fontName()
    let font = UIFont(name: val.name, size: CGFloat(val.size));
    return font!
}

public func MCFontPF(_ size: Int, _ type: MCFontCategory.typeface) -> UIFont {
    return MCFont(.PingFangSC(size, type))
}

public extension UIFont{
    static func MC(_ size: Int = 14, _ type : MCFontCategory.typeface = .Regular)->UIFont{
        return MCFontPF(size, type)
    }
}
