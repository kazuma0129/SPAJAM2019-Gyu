//
//  CameraViewController.swift
//  SPAJAM-Gyu
//
//  Created by 大村優輝 on 2019/05/11.
//  Copyright © 2019 KazumaOhashi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class CameraViewController: UIViewController{
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let c = UIImagePickerController()
//        c.mediaTypes = ["public.movie"]
        present(c, animated: true)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // [1]ストレージ サービスへの参照を取得
        let storage = Storage.storage()
        
        // [2]ストレージへの参照を取得
        let storageRef = storage.reference(forURL: "gs://<your-firebase-storage-bucket>")
        
        // [3]ツリーの下位への参照を作成
        let imageRef = storageRef.child("image.jpg")
        
        // [4]Dataを作成
        let imageData = UIImageJPEGRepresentation(UIImage(named: "image")!, 1.0)!
        
        // [5]アップロードを実行
        imageRef.put(imageData, metadata: nil) { metadata, error in
            if (error != nil) {
                print("Uh-oh, an error occurred!")
            } else {
                let downloadURL = metadata!.downloadURL()!
                print("downloadURL:", downloadURL)
            }
        }
        
        
    }
}
