//
//  MainVC.swift
//  NativeImagePicker
//
//  Created by lymanny on 30/1/25.
//

import UIKit

class MainVC: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties & Variable
    let imagePicker = ImagePickerManager()
    let imageVM     = ImageVM()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        imagePicker.delegate = self
    }
    
    //MARK: - Function
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(showImageSourceOptions)
        )
    }
    
    //MARK: - OBJC
    @objc func showImageSourceOptions() {
        let alert = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.imagePicker.showCamera(from: self)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: { _ in
            self.imagePicker.showGallery(from: self)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(alert, animated: true)
    }
    
    @objc func deleteImage(_ sender: UIButton) {
        // Get the cell where the delete button was tapped
        guard let cell = sender.superview?.superview as? ImageCell,
              let indexPath = tableView.indexPath(for: cell) else { return }
        
        imageVM.deleteImage(at: indexPath.row)
        
        DispatchQueue.main.async {
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageVM.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell
        
        cell.configCell(image: imageVM.getImage(at: indexPath.row))
        cell.btnDelete.addTarget(self, action: #selector(deleteImage(_:)), for: .touchUpInside)
        
        return cell
    }
}

//MARK: - ImagePickerDelegate
extension MainVC: ImagePickerDelegate {
    func didSelectImages(_ images: [UIImage]) {
        let startIndex = imageVM.numberOfItems()
        imageVM.addImages(images)
        
        let newIndexPaths = (startIndex..<imageVM.numberOfItems()).map { IndexPath(row: $0, section: 0) }
        
        DispatchQueue.main.async {
            self.tableView.insertRows(at: newIndexPaths, with: .automatic)
        }
    }
    
    
}
