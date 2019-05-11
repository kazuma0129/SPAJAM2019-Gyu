//
//  CameraViewController.swift
//  SPAJAM-Gyu
//
//  Created by 大村優輝 on 2019/05/11.
//  Copyright © 2019 KazumaOhashi. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController{
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let c = UIImagePickerController()
        c.mediaTypes = ["public.movie"]
        present(c, animated: true)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
