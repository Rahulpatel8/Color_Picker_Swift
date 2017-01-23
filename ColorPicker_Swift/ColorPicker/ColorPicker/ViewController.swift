//
//  ViewController.swift
//  ColorPicker
//
//  Created by SOTSYS024 on 11/01/17.
//  Copyright © 2017 SOTSYS024. All rights reserved.
//

import UIKit

class ViewController: UIViewController,ColorPickerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnClicked(_ sender: UIButton) {
        let colorPickerController = ColorPickerController(nibName: "ColorPickerController", bundle: nil)
        colorPickerController.delegate = self
        colorPickerController.modalPresentationStyle = .overCurrentContext
        self.present(colorPickerController, animated: true, completion: nil)
    }
    
    func colorPickerControllerDidComplete(id: Any, color: UIColor) {
        self.view.backgroundColor = color
        (id as! ColorPickerController).dismiss(animated: true, completion: nil)
    }
    
}

