//
//  AlbumCell.swift
//  JSON Placeholder
//
//  Created by Pavel Semenchenko on 20.10.2022.
//

import UIKit

class AlbumCell: UITableViewCell {
    
    @IBOutlet weak var userIdCell: UILabel!
    
    @IBOutlet weak var idCell: UILabel!
    
    @IBOutlet weak var titleCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    var data: Album! {
        didSet {
            prepareForReuse()
        }
    }
    var albumsRepository: AlbumsRepository!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userIdCell.text = "The User Id is: \(data.userId)"
        idCell.text = "ID is: \(data.id)"
        titleCell.text = "\(data.title)"
    }
    
    
}
