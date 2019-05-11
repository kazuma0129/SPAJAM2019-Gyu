//
//  CameraViewController.swift
//  SPAJAM-Gyu
//
//  Created by 大村優輝 on 2019/05/11.
//  Copyright © 2019 KazumaOhashi. All rights reserved.
//

import UIKit
import Photos
import Firebase
import FirebaseStorage

//@objc(ViewController)
class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let c = UIImagePickerController()
        c.delegate = self
//        c.mediaTypes = ["public.movie"]
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            c.sourceType = .camera
        } else {
            c.sourceType = .photoLibrary
        }
        
        present(c, animated: true, completion:nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        
        if #available(iOS 8.0, *), let referenceUrl = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.referenceURL)] as? URL {
            let assets = PHAsset.fetchAssets(withALAssetURLs: [referenceUrl], options: nil)
            let asset = assets.firstObject
            asset?.requestContentEditingInput(with: nil, completionHandler: { (contentEditingInput, info) in
                let imageFile = contentEditingInput?.fullSizeImageURL
                let filePath = "test_user" + "/\(Int(Date.timeIntervalSinceReferenceDate * 1000))/\(imageFile!.lastPathComponent)"
                let storage = Storage.storage()
                // [START uploadimage]
                let storageRef = storage.reference(withPath: filePath)
                storageRef.putFile(from: imageFile!, metadata: nil) { (metadata, error) in
                    if let error = error {
                        print("Error uploading: \(error)")
                        return
                    }
                    self.uploadSuccess(storageRef, storagePath: filePath)
                }
                // [END uploadimage]
            })
        } else {
            guard let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage else { return }
            guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
            
            let imagePath = "image/samp.jpg"
            let metadata = StorageMetadata()
            metadata.contentType = "image/jpeg"
            let storage = Storage.storage()
            let storageRef = storage.reference(withPath: imagePath)
            storageRef.putData(imageData, metadata: metadata) { (metadata, error) in
                if let error = error {
                    print("Error uploading: \(error)")
                    return
                }
                self.uploadSuccess(storageRef, storagePath: imagePath)
            }
        }
        picker.dismiss(animated: true , completion: nil)

        
    }
    func uploadSuccess(_ storageRef: StorageReference, storagePath: String) {
        print("Upload Succeeded!")
        storageRef.downloadURL { (url, error) in
            if let error = error {
                print("Error getting download URL: \(error)")
                return
            }
            UserDefaults.standard.set(storagePath, forKey: "storagePath")
            UserDefaults.standard.synchronize()
        }
        self.dismiss(animated: true , completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion:nil)
    }
}

fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}
