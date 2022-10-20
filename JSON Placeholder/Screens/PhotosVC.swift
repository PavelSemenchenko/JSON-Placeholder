//
//  PhotosVC.swift
//  JSON Placeholder
//
//  Created by Pavel Semenchenko on 19.10.2022.
//

import Foundation
import UIKit


class PhotosVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var photosCollection: UICollectionView!
    let photosRepository = PhotosRepository()
    var photos: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "PhotoViewCell", bundle: nil)
        
    }
    // @DocumentID var id: String?
    var loadPhotosCompletion: ((Album?) -> Void)?
}



