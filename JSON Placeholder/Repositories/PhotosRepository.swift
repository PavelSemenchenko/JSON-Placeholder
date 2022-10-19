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
    func loadAll(completion: @escaping ([Photo]) -> Void) {
        let request = AF.request("https://jsonplaceholder.typicode.com/photos?albumId=2")
        request.responseDecodable(of: [Photo].self) {photosResponse in
            completion(photosResponse.value ?? [])
        }
    }
}
// albumId = 2 \(albumId)

