////
////  cameraExtention.swift
////  SPAJAM-Gyu
////
////  Created by 大村優輝 on 2019/05/11.
////  Copyright © 2019 KazumaOhashi. All rights reserved.
////
//
//import UIKit
//import Firebase
//import FirebaseStorage
//
//extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let image = info[.originalImage] as? UIImage
//        
//        let mediaType = info[.originalImage] as? String // → public.image
//        guard let imageUrl = info[.originalImage] as? URL else { return } // → assets-library://asset/asset.JPG?id=XXXX&ext=JPG
//        
//        // [1]ストレージ サービスへの参照を取得
//        let storage = Storage.storage()
//        
//        // [2]ストレージへの参照を取得
//        let storageRef = storage.reference(forURL: "gs://spajam-gyu.appspot.com")
//        // File located on disk
////        let localFile =
//        
//        // Create a reference to the file you want to upload
//        let riversRef = storageRef.child("images/rivers.jpg")
//        
//        // Upload the file to the path "images/rivers.jpg"
//        let uploadTask = riversRef.putFile(from: imageUrl, metadata: nil) { metadata, error in
//            guard let metadata = metadata else {
//                // Uh-oh, an error occurred!
//                return
//            }
//            // Metadata contains file metadata such as size, content-type.
//            let size = metadata.size
//            // You can also access to download URL after upload.
//            storageRef.downloadURL { (url, error) in
//                guard let downloadURL = url else {
//                    // Uh-oh, an error occurred!
//                    return
//                }
//                print(downloadURL)
//            }}
//
//    }
//}
