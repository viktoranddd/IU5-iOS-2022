//
//  NetworkRequestFactory.swift
//  LABS
//
//  Created by Viktor Andreev on 04.04.2022.
//

import Foundation

enum HTTPRequestType: String {
    case get = "GET"
    case post = "POST"
}

protocol NetworkRequestFactoryProtocol {
    func getExchangeRate() -> URLRequest
}

final class NetworkRequestFactory: NetworkRequestFactoryProtocol {
    
    private enum Constants {
        static let baseURL = URL(string: "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/usd/rub.json")!
    }
    
    func getExchangeRate() -> URLRequest {
        return URLRequest(url: Constants.baseURL)
    }
}
