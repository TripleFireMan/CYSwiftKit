//
//  Device.swift
//  MasterConverge
//
//  Created by MiTu on 2020/6/17.
//  Copyright © 2020 刘金丰. All rights reserved.
//

import Foundation
import UIKit

/// 主 Bundle
public let MC_Bundle = Bundle.main

/// 屏幕宽度
public let MC_W = UIScreen.main.bounds.width

/// 屏幕高度
public let MC_H = UIScreen.main.bounds.height

/// 是否为 iPad
public let MC_iPad = UI_USER_INTERFACE_IDIOM() == .pad

/// 设备对象
public let MC_Divice = UIDevice.current

/// 非全面屏状态栏高度
public let MC_NorStaBarH: CGFloat = 20

/// 全面屏 状态栏高度
public let MC_FullStaBarH: CGFloat = 44

/// 状态栏高度
public let MC_StaBarH: CGFloat = MC_Full ? MC_FullStaBarH : MC_NorStaBarH;

/// 导航条高度
public let MC_NaviBarH: CGFloat = 44;

/// 状态栏和导航条总高度
public let MC_StaNaviBarH: CGFloat = MC_StaBarH + MC_NaviBarH

/// 底部TabBar增量
public let MC_TabBarIncrementH: CGFloat = MC_Full ? 34 : 0

/// 底部TabBar高度
public let MC_TabBarH: CGFloat = (49 + MC_TabBarIncrementH)

/// 是否为全面屏
public let MC_Full = MC_Divice.isFullScreen()


/// 屏宽比 已iPhone8Plus 为基准
public let MC_ScaleW = MC_W / 375

/// 屏高比 已iPhone8Plus 为基准
public let MC_ScaleH = MC_H / 667

/// 分割线高度
public let MC_SeparatorH: CGFloat = 0.5

public func MC_AutoLen(size: CGFloat) -> CGFloat {
    return MC_iPad ? MC_ScaleH * size : MC_ScaleW * size
}

public extension UIDevice {
    func isFullScreen() -> Bool {
        guard let keyWindow = UIApplication.shared.keyWindow else {
            return false
        }
        if #available(iOS 11.0, *) {
            return keyWindow.safeAreaInsets.bottom > 0
        } else {
            return false
        }
    }
}
