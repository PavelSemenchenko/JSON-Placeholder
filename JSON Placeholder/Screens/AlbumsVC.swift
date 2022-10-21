//
//  AlbumsVC.swift
//  JSON Placeholder
//
//  Created by Pavel Semenchenko on 19.10.2022.
//

import Foundation
import UIKit

class AlbumsVC: UIViewController, UITableViewDataSource,  UITableViewDelegate {
    
    @IBOutlet weak var albumsTable: UITableView!
    
    
    let albumsRepository = AlbumsRepository()
    var albums: [Album] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "AlbumCell", bundle: nil)
        albumsTable.dataSource = self
        albumsTable.register(cellNib, forCellReuseIdentifier: "albumCell")
        
        getAlbums()
    }
    
    func getAlbums() {
        albumsRepository.loadAll { allAlbums in
            self.albums = allAlbums
            self.albumsTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumCell", for: indexPath) as! AlbumCell
        cell.data = albums[indexPath.row]
        cell.albumsRepository = albumsRepository
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        // что сделать после - куда идем и что делаем/ открываем?
        let albumToOpen = albums[index]
        let openController = PhotosVC()
        openController.currentAlbum = albumToOpen
        self.navigationController?.pushViewController((openController), animated: true)
        openController.photosCollection.reloadData()
        
    }
}

