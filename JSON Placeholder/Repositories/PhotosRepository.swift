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
    let albumId: String
    let thumbnailUrl: String
}


class PhotosRepository {
    func loadAll(albumId: Int, completion: @escaping ([Photo]) -> Void) {
        let request = AF.request("https://jsonplaceholder.typicode.com/photos?albumId=\(albumId)")
        request.responseDecodable(of: [Photo].self) {photosResponse in
            completion(photosResponse.value ?? [])
        }
    }
}



