//
//  ColorPickerControllerViewController.swift
//  ColorPicker
//
//  Created by SOTSYS024 on 11/01/17.
//  Copyright © 2017 SOTSYS024. All rights reserved.
//

import UIKit

protocol ColorPickerDelegate {
    func colorPickerControllerDidComplete(id : Any, color : UIColor)
}

class ColorPickerController: UIViewController {

    
    @IBOutlet var buttons: [UIButton]!
    var delegate : ColorPickerDelegate?
    @IBOutlet weak var sliderColor: ColorSlider!
    @IBOutlet weak var alphaSlider: AlphaSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        alphaSlider.colorValue = sliderColor.value
        sliderColor.alphaValue = alphaSlider.value
        let value: Float = sliderColor.value
        alphaSlider.value = 0.0
        for btn: UIButton in buttons {
            let i = CGFloat(buttons.index(of: btn)!)
            btn.backgroundColor = UIColor(hue: CGFloat(value), saturation: CGFloat(i+0.1), brightness: 1.0, alpha: CGFloat(1 - alphaSlider.value))
        }
    }
    
    @IBAction func sliderColorChanged(_ sender: ColorSlider) {
        sliderColor.alphaValue = alphaSlider.value
        let value: Float = sliderColor.value
        
        for btn: UIButton in buttons {
            let i = CGFloat(buttons.index(of: btn)!)
            btn.backgroundColor = UIColor(hue: CGFloat(value), saturation: CGFloat(i+0.1), brightness: 1.0, alpha: CGFloat(1 - alphaSlider.value))
        }
        alphaSlider.colorValue = sliderColor.value
        alphaSlider.setNeedsDisplay()
    }
    
    @IBAction func sliderAlphaChanged(_ sender: AlphaSlider) {
        let value: Float = sliderColor.value
        sliderColor.alphaValue = sender.value
        for btn: UIButton in buttons {
            let i = CGFloat(buttons.index(of: btn)!)
            btn.backgroundColor = UIColor(hue: CGFloat(value), saturation: CGFloat(i+0.1), brightness: 1.0, alpha: CGFloat(1 - alphaSlider.value))
        }
    }
    
    @IBAction func buttonClicked(_ sender: UIButton) {
        if (self.delegate != nil) {
            self.delegate?.colorPickerControllerDidComplete(id: self, color: sender.backgroundColor!)
        }
    }
    
    @IBAction func btnOkClicked(_ sender: UIButton) {
        if (self.delegate != nil) {
            self.delegate?.colorPickerControllerDidComplete(id: self, color: sliderColor.color())
        }
    }
    
    @IBAction func btnCancelClicked(_ sender: UIButton) {
        if (self.delegate != nil) {
            self.delegate?.colorPickerControllerDidComplete(id: self, color: UIColor())
        }
    }

}
