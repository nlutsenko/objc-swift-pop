//
//  POPBasicAnimation+Swift.swift
//  AnimateMe
//
//  Copyright © 2015 Nikita Lutsenko. All rights reserved.
//

import Foundation
import pop

protocol AnimatableType {
    var objectValue: NSValue { get }
}

extension CGSize: AnimatableType {
    var objectValue: NSValue {
        return NSValue(CGSize: self)
    }
}

enum AnimatablePropertyName: String {
    case LayerScaleXY = "scaleXY"
}

class Animation<T : AnimatableType> {
    var fromValue: T?
    var toValue: T? {
        didSet {
            if let value = toValue {
                popAnimation.toValue = value.objectValue
            }
        }
    }

    let popAnimation: POPBasicAnimation

    init(_ type: T.Type, propertyName: AnimatablePropertyName) {
        popAnimation = POPBasicAnimation(propertyNamed: propertyName.rawValue)
    }
}

extension CALayer {
    func addAnimation<T>(animation: Animation<T>, key: String) {
        pop_addAnimation(animation.popAnimation, forKey: key)
    }
}
