// MARK：扩展按钮的点击区域
import Foundation
func associatedObject<ValueType: AnyObject>(
    base: AnyObject,
    key: UnsafePointer<UInt8>,
    initialiser: () -> ValueType)
    -> ValueType {
        if let associated = objc_getAssociatedObject(base, key)
            as? ValueType { return associated }
        let associated = initialiser()
        objc_setAssociatedObject(base, key, associated,
                                 .OBJC_ASSOCIATION_RETAIN)
        return associated
}
func associateObject<ValueType: AnyObject>(
    base: AnyObject,
    key: UnsafePointer<UInt8>,
    value: ValueType) {
    objc_setAssociatedObject(base, key, value,
                             .OBJC_ASSOCIATION_RETAIN)
}

private var topKey: UInt8 = 0
private var bottomKey: UInt8 = 0
private var leftKey: UInt8 = 0
private var rightKey: UInt8 = 0
public extension UIButton {
    var mc_top: NSNumber {
        get {
            return associatedObject(base: self, key: &topKey)
            { return 0 }
        }
        set {
            associateObject(base: self, key: &topKey, value: newValue)
        }
    }

    var mc_bottom: NSNumber {
        get {
            return associatedObject(base: self, key: &bottomKey)
            { return 0 }
        }
        set {
            associateObject(base: self, key: &bottomKey, value: newValue)
        }
    }

    var mc_left: NSNumber {
        get {
            return associatedObject(base: self, key: &leftKey)
            { return 0 }
        }
        set {
            associateObject(base: self, key: &leftKey, value: newValue)
        }
    }

    var mc_right: NSNumber {
        get {
            return associatedObject(base: self, key: &rightKey)
            { return 0 }
        }
        set {
            associateObject(base: self, key: &rightKey, value: newValue)
        }
    }

    func setEnlargeEdge(top: Float, bottom: Float, left: Float, right: Float) -> Void {
        self.mc_top = NSNumber.init(value: top)
        self.mc_bottom = NSNumber.init(value: bottom)
        self.mc_left = NSNumber.init(value: left)
        self.mc_right = NSNumber.init(value: right)
    }

    func enlargedRect() -> CGRect {
        let top = self.mc_top
        let bottom = self.mc_bottom
        let left = self.mc_left
        let right = self.mc_right
        if top.floatValue >= 0, bottom.floatValue >= 0, left.floatValue >= 0, right.floatValue >= 0 {
            return CGRect.init(x: self.bounds.origin.x - CGFloat(left.floatValue),
                               y: self.bounds.origin.y - CGFloat(top.floatValue),
                               width: self.bounds.size.width + CGFloat(left.floatValue) + CGFloat(right.floatValue),
                               height: self.bounds.size.height + CGFloat(top.floatValue) + CGFloat(bottom.floatValue))
        }
        else {
            return self.bounds
        }
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let rect = self.enlargedRect()
        if rect.equalTo(self.bounds) {
            return super.point(inside: point, with: event)
        }
        return rect.contains(point) ? true : false
    }
}
