//
//  ViewController.swift
//  AnimateMe
//
//  Copyright © 2015 Nikita Lutsenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let button = BouncyButton()
        button.setTitle("Yolo", forState: .Normal)
        button.backgroundColor = UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1.0)
        button.frame = CGRectMake(0, 0, 200, 50)
        button.center = view.center
        self.view.addSubview(button)
    }

}

