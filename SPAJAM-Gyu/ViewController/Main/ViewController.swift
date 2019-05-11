//
//  ViewController.swift
//  SPAJAM-Gyu
//
//  Created by KazumaOhashi on 2019/05/10.
//  Copyright © 2019 KazumaOhashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.dismiss(animated: true , completion: nil)
        print("VCviewDidDisappear")
    }

}

