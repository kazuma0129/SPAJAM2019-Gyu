//
//  cameraExtention.swift
//  SPAJAM-Gyu
//
//  Created by 大村優輝 on 2019/05/11.
//  Copyright © 2019 KazumaOhashi. All rights reserved.
//

import UIKit

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // キャンセルボタンを押された時に呼ばれる
    }
    
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 写真が選択された時に呼ばれる
        let image = info[.originalImage] as? UIImage
        let mediaType = info[.originalImage] as? String // → public.image
        let imageUrl = info[.originalImage] as? URL // → assets-library://asset/asset.JPG?id=XXXX&ext=JPG
        
    }
}
