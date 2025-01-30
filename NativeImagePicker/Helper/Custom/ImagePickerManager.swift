//
//  ImagePickerManager.swift
//  NativeImagePicker
//
//  Created by lymanny on 30/1/25.
//

import UIKit
import PhotosUI

protocol ImagePickerDelegate: AnyObject {
    func didSelectImages(_ images: [UIImage])
}

class ImagePickerManager: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    
    weak var delegate: ImagePickerDelegate?
    weak var viewController: UIViewController?
    
    // Open Camera (Single Image)
    func showCamera(from viewController: UIViewController) {
        self.viewController = viewController
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            viewController.present(picker, animated: true)
        }
    }
    
    // Open Gallery (Multiple Images)
    func showGallery(from viewController: UIViewController) {
        self.viewController = viewController
        var config = PHPickerConfiguration()
        config.selectionLimit = 5 // Allows multiple images
        config.filter = .images
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        viewController.present(picker, animated: true)
    }
    
    // Handle Single Image (Camera)
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            delegate?.didSelectImages([image])
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    // Handle Multiple Images (Gallery)
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        var selectedImages: [UIImage] = []
        let group = DispatchGroup()
        
        for result in results {
            group.enter()
            result.itemProvider.loadObject(ofClass: UIImage.self) { (object, error) in
                if let image = object as? UIImage {
                    selectedImages.append(image)
                }
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.delegate?.didSelectImages(selectedImages)
        }
    }
}


