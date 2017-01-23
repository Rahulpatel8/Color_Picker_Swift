//
//  ColorSlider.swift
//  ColorPicker
//
//  Created by SOTSYS024 on 11/01/17.
//  Copyright © 2017 SOTSYS024. All rights reserved.
//

import UIKit

class ColorSlider: UISlider {

    var colorTemp : UIColor?
    var alphaValue : Float?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        for x in 0 ..< Int(self.frame.size.width) {
            let color = UIColor(hue: CGFloat((CGFloat(x) / self.frame.size.width)), saturation: CGFloat(1.0), brightness: CGFloat(1.0), alpha: CGFloat(1.0))
            color.set()
            let rectnew = CGRect(x: CGFloat(x), y: CGFloat(self.frame.size.height / 2 - 2), width: CGFloat(self.frame.size.width * CGFloat(x)), height: CGFloat(4))
            UIRectFill(rectnew)
        }
        self.setMinimumTrackImage(self.image(from: UIColor.clear), for: .normal)
        self.setMaximumTrackImage(self.image(from: UIColor.clear), for: .normal)
    }
    
    override func setValue(_ value: Float, animated: Bool) {
        super.setValue(value, animated: animated)
        let color = UIColor(hue: CGFloat(self.value), saturation: CGFloat(1.0), brightness: CGFloat(1.0), alpha: CGFloat(1 - alphaValue!))
        colorTemp = color
    }
    
    func color() -> UIColor {
        return UIColor(hue: CGFloat(self.value), saturation: CGFloat(1.0), brightness: CGFloat(1.0), alpha: CGFloat(1 - alphaValue!))
    }
    
    func image(from color: UIColor) -> UIImage {
        let rect = CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(1), height: CGFloat(1))
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

}
