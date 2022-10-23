//
//  CollectionViewCell.swift
//  JSON Placeholder
//
//  Created by Pavel Semenchenko on 20.10.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var albumPhotosImage: UIImageView!
    
    @IBOutlet weak var albumIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    var data: Photo! {
        didSet {
            prepareForReuse()
        }
    }
    var photosRepository: PhotosRepository!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumIdLabel.text = String(data.albumId)
        guard let url = URL(string: data.thumbnailUrl) else {
            albumPhotosImage.image = nil
            return
        }
        albumPhotosImage.af.setImage(withURL: url)
    }

}
