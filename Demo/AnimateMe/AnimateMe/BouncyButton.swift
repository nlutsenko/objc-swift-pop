//
//  BouncyButton.swift
//  AnimateMe
//
//  Copyright © 2015 Nikita Lutsenko. All rights reserved.
//

import UIKit
import pop

class BouncyButton: UIButton {

    let scaleAnimationKey = "scaleAnimationKey"
    let scaleSpringAnimationKey = "scaleSpringAnimationKey"
    let roundAnimationKey = "roundAnimationKey"

    dynamic var selectionProgress: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = frame.size.height / 2 * selectionProgress
        }
    }

    init() {
        super.init(frame: CGRectZero)

        addTarget(self, action: "scaleToSmall", forControlEvents: [.TouchDown, .TouchDragEnter])
        addTarget(self, action: "animateSelection", forControlEvents: .TouchUpInside)
        addTarget(self, action: "scaleToDefault", forControlEvents: .TouchDragExit)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension BouncyButton {
    func scaleToSmall() {
        let animation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        animation.toValue = NSValue(CGSize: CGSizeMake(0.75, 0.75))
        layer.pop_addAnimation(animation, forKey: scaleAnimationKey)
    }

    func scaleToDefault() {
        let animation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        animation.toValue = NSValue(CGSize: CGSizeMake(1.0, 1.0))
        layer.pop_addAnimation(animation, forKey: scaleAnimationKey)
    }
}

extension BouncyButton {

    func animateSelection() {
        let animation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        animation.toValue = NSValue(CGSize: CGSizeMake(1.0, 1.0))
        layer.pop_addAnimation(animation, forKey: scaleSpringAnimationKey)

        if let keys = layer.pop_animationKeys() as? [String] where keys.contains(scaleAnimationKey) {
            layer.pop_removeAnimationForKey(scaleAnimationKey)
            return
        }

        let property = POPAnimatableProperty.propertyWithName("selectionProgress") { prop -> Void in
            if let prop = prop {
                prop.readBlock = { object, values in
                    if let object = object as? BouncyButton {
                        values[0] = object.selectionProgress
                    }
                }
                prop.writeBlock = { object, values in
                    if let object = object as? BouncyButton {
                        object.selectionProgress = values[0]
                    }
                }
                prop.threshold = 0.01
            }
        }
        if let property = property as? POPAnimatableProperty {
            let animation = POPBasicAnimation()
            animation.property = property
            animation.toValue = (selectionProgress == 1.0 ? 0.0 : 1.0)
            pop_addAnimation(animation, forKey: roundAnimationKey)
        }
    }
}
