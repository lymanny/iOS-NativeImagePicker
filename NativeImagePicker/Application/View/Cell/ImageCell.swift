//
//  ImageCell.swift
//  NativeImagePicker
//
//  Created by lymanny on 30/1/25.
//

import UIKit

class ImageCell: UITableViewCell {
    
    //MARK: - @IBOutlet
    @IBOutlet var photoImageView : UIImageView!
    @IBOutlet var btnDelete      : UIButton!
    
    //MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    //MARK: - Function
    func setupUI() {
        photoImageView.layer.cornerRadius = 8
        photoImageView.clipsToBounds = true
    }
    
    func configCell(image: UIImage?) {
        photoImageView.image = image
    }
}

