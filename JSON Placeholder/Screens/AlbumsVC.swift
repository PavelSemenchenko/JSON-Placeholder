//
//  AlbumsVC.swift
//  JSON Placeholder
//
//  Created by Pavel Semenchenko on 19.10.2022.
//

import Foundation
import UIKit

class AlbumsVC: UIViewController, UITableViewDataSource {
    
    
    
    // outlet on table with name albumsTable
    let albumsRepository = AlbumsRepository()
    var albums: [Albums] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "AlbumCell", bundle: nil)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "albumsCell", for: IndexPath) as! AlbumCell
        cell.data = albums[indexPath.row]
        cell.albumsRepository = albumsRepository
        return cell
    }
}
