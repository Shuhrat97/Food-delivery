//
//  NetworkManager.swift
//  Food-Delivery
//
//  Created by Shuhrat Nurov on 03/04/23.
//

import Foundation

enum ResultType<T> {
    case success(model: T)
    case failure(error: Error)
}

enum HttpMethod: String {
    case get
    case post
    var method: String { rawValue.uppercased() }
}

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T: Decodable>(fromURL url: URL, httpMethod: HttpMethod = .get, completion: @escaping (ResultType<T>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.method
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            if let data = data, let response = response as? HTTPURLResponse,
               (response.statusCode >= 200 && response.statusCode < 300) {
                let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(T.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(model: model))
                    }
                } catch {
                    completion(.failure(error: error))
                }
            } else {
                if let error = error as? Error {
                    completion(.failure(error: error))
                }
            }
        }

        task.resume()
    }
}


