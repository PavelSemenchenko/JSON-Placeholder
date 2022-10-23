//
//  PhotosRepository.swift
//  JSON Placeholder
//
//  Created by Pavel Semenchenko on 19.10.2022.
//

import Foundation
import Alamofire
import AlamofireImage

struct Photo: Codable {
    let albumId: Int
    let thumbnailUrl: String
}


class PhotosRepository {
    func loadAll(albumId: Int, completion: @escaping ([Photo]) -> Void) {
        let urlEndPoint = "https://jsonplaceholder.typicode.com/photos?albumId=\(albumId)"
        let request = AF.request(urlEndPoint)
        request.responseDecodable(of: [Photo].self) {photosResponse in
            //let photos = photosResponse.value ?? []
           // completion(photos)
            completion(photosResponse.value ?? [])
        }
    }
}
