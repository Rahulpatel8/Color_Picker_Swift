//
//  AlphaSlider.swift
//  ColorPicker
//
//  Created by SOTSYS024 on 11/01/17.
//  Copyright © 2017 SOTSYS024. All rights reserved.
//

import UIKit

class AlphaSlider: UISlider {
    
    var colorValue : Float?

    override func draw(_ rect: CGRect) {
        for x in 0..<Int(self.frame.size.width) {
            let color = UIColor(hue: CGFloat(colorValue!), saturation: CGFloat(1.0), brightness: CGFloat(1.0), alpha: CGFloat((1 - (CGFloat(x) / self.frame.size.width))))
            color.set()
            let rectnew = CGRect(x: CGFloat(x), y: CGFloat(self.frame.size.height / 2 - 2), width: CGFloat(self.frame.size.width * CGFloat(x)), height: CGFloat(4))
            UIRectFill(rectnew)
        }
        self.setMinimumTrackImage(self.image(from: UIColor.clear), for: .normal)
        self.setMaximumTrackImage(self.image(from: UIColor.clear), for: .normal)
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
