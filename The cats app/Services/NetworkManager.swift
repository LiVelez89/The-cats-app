//
//  NetworkManager.swift
//  The cats app
//
//  Created by Lina on 27/02/23.
//

import Foundation

struct Constants {
    
    static let baseURL = "https://api.thecatapi.com/v1/breeds"
    static let apiKey = "bda53789-d59e-46cd-9bc4-2936630fde39"
    static let imageURL = "https://api.thecatapi.com/v1/images/search?limit=10&breed_ids=beng&api_key=bda53789-d59e-46cd-9bc4-2936630fde39"
}
enum APIError: Error {
    case failedToGetData
    case badUrl
    case failedToDecodeData
}

struct NetworkManager {
    func makeRequest<T: Decodable>(type: T.Type, completion: @escaping (Result<T, APIError>) -> Void) {
     
        guard let url = URL(string: Constants.baseURL+"?api_key="+Constants.apiKey) else {
            completion(.failure(APIError.badUrl))
            return
        }
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            do {
                let results = try JSONDecoder().decode(type, from: data)
                completion(.success(results))
            } catch {
                completion(.failure(APIError.failedToDecodeData))
            }
        }
        task.resume()
    }
}
