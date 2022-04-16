//
//  NetworkService.swift
//  LABS
//
//  Created by Viktor Andreev on 04.04.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func sendRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    private let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func sendRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(.failure(error))
                    return
                }
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200
            else {
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    completion(.success(data))
                }
                
            }
        }.resume()
    }
    
    
    
    
}
