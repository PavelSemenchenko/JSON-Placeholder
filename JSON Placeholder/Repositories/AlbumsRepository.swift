//
//  AlbumsRepository.swift
//  JSON Placeholder
//
//  Created by Pavel Semenchenko on 19.10.2022.
//

import Foundation
import Alamofire

struct Album: Codable {
    let userId: Int
    let id: Int
    let title: String
}

class AlbumsRepository {
    func loadAll(completion: @escaping ([Album]) -> Void) {
        let request = AF.request("https://jsonplaceholder.typicode.com/albums")
        request.responseDecodable(of: [Album].self) { albumsResponse in
            completion(albumsResponse.value ?? [])
        }
    }
}

