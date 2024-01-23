//
//  Typealias.swift
//  MasterConverge
//
//  Created by MiTu on 2020/9/4.
//  Copyright © 2020 刘金丰. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC


fileprivate var MC_Closures_Key = "MC_Closures"

/// 空闭包, 不带参数和返回值
public typealias MC_Empty_Closure = () -> Void

/// 带泛型参数P 和 泛型返回值R 的闭包
public typealias MC_Closure_P_R<P, R> = (P) -> R

/// 带泛型参数P1, P2  和 泛型返回值R 的闭包
public typealias MC_Closure_P1P2_R<P1, P2, R> = (P1, P2) -> R

public class MCClosure {
    
}

public class MCEmptyClosure: MCClosure {
    public var closure: MC_Empty_Closure
    public init(_ closure: @escaping MC_Empty_Closure) {
        self.closure = closure
    }
}

public class MCClosurePR<P, R>: MCClosure {
    public var closure: MC_Closure_P_R<P, R>
    public init(_ closure: @escaping MC_Closure_P_R<P, R>) {
        self.closure = closure
    }
}

public class MCClosureP1P2R<P1, P2, R>: MCClosure {
    public var closure: MC_Closure_P1P2_R<P1, P2, R>
    public init(_ closure: @escaping MC_Closure_P1P2_R<P1, P2, R>) {
        self.closure = closure
    }
}


public protocol MCClosureProtocal {
    func setClick<T: MCClosure>(_ key: Int, _ closure: T)
    func getClick<T: MCClosure>(_ key: Int, _ type: T.Type) -> T?
}

public extension MCClosureProtocal where Self: NSObject {
     func setClick<T: MCClosure>(_ key: Int, _ closure: T) {
        var closureMap = objc_getAssociatedObject(self, &MC_Closures_Key) as? [Int: MCClosure]
        if closureMap == nil { closureMap = [:] }
        closureMap?[key] = closure
        objc_setAssociatedObject(self, &MC_Closures_Key, closureMap as Any, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func getClick<T: MCClosure>(_ key: Int, _ type: T.Type) -> T? {
        let closureMap = objc_getAssociatedObject(self, &MC_Closures_Key) as? [Int: MCClosure]
        guard let map = closureMap else {
            return nil
        }
        return map[key] as? T
    }
    
    func delClick(_ key: Int) {
        if var closureMap = objc_getAssociatedObject(self, &MC_Closures_Key) as? [Int: MCClosure],
           closureMap.keys.contains(key) {
            closureMap[key] = nil
            objc_setAssociatedObject(self, &MC_Closures_Key, closureMap as Any, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
