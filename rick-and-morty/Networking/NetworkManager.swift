//
//  NetworkManager.swift
//  rick-and-morty
//
//  Created by Winlentia on 16.01.2021.
//

import Foundation
import Alamofire

public enum NetworkError {
    case common
    case url
    case decode
    case emptyData
}


struct NetworkManager {

    let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    func requestAf<T: Codable>(url: URL, type: T.Type,
                               onSuccess: @escaping (_ result: T) -> (),
                               onFailure: @escaping (_ error: NetworkError) -> ()) {
        AF.request(url).responseDecodable(of: T.self, decoder: decoder) { (response) in
            if response.error != nil {
                onFailure(.common)
                return
            }
            guard let data = response.value else {
                onFailure(.decode); return
            }
            onSuccess(data)
        }
    }
}
