//
//  Color.swift
//  CardTabbar
//
//  Created by Yusa Dogru on 25.11.2021.
//

import UIKit

extension UIColor {
    static let barTintColor = UIColor.red
    static let backgroundColor = UIColor.red
    @available(iOS 11.0, *)
    static let tintColor = UIColor(named: "color_indicator")
    
    @available(iOS 11.0, *)
    convenience init?(named: String) {
        self.init(named: named, in: .resourceBundles, compatibleWith: nil)
    }
}
