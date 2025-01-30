//
//  ImageVM.swift
//  NativeImagePicker
//
//  Created by lymanny on 30/1/25.
//

import UIKit

class ImageVM {
    
    //MARK: - Properties & Variable
    private var images: [ImageModel] = []
    
    //MARK: - Function
    func numberOfItems() -> Int {
        return images.count
    }
    
    func getImage(at index: Int) -> UIImage {
        return images[index].image ?? UIImage(named: "no_image")!
    }
    
    func addImages(_ newImages: [UIImage]) {
        for img in newImages {
            images.append(ImageModel(image: img))
        }
    }
    
    func deleteImage(at index: Int) {
        guard index < images.count else { return }
        images.remove(at: index)
    }
}

