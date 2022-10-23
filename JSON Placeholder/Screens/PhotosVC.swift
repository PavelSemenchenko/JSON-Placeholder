//
//  PhotosVC.swift
//  JSON Placeholder
//
//  Created by Pavel Semenchenko on 19.10.2022.
//

import Foundation
import UIKit

class PhotosVC: UICollectionViewController {
    
    @IBOutlet var photosCollection: UICollectionView!
    
    let photosRepository = PhotosRepository()
    var photos: [Photo] = []
    var currentAlbum: Album!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.dataSource = self
        collectionView.register(cellNib, forCellWithReuseIdentifier: "CollectionViewCell")
        
        getPhotos()
    }
    
    // var loadPhotosCompletion: ((Album?) -> Void)?
    
    func getPhotos() {
        photosRepository.loadAll(albumId: currentAlbum.id) { photos in
            self.photos = photos
            self.collectionView.reloadData()
         }
                                 
     }
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let rawCell = photosCollection.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell",
                                                           for: indexPath)
        guard let cell = rawCell as? CollectionViewCell else {
            fatalError("error")
        }
        cell.data = photos[indexPath.row]
        cell.photosRepository = photosRepository
        return cell
    }
}
                                 
                                 
                                 
