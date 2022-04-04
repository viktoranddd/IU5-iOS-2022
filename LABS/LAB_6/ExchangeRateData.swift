//
//  ExchangeRateData.swift
//  LABS
//
//  Created by Viktor Andreev on 04.04.2022.
//

import Foundation

struct ExchangeRateData: Decodable {
    let date: String
    let rublesPerDollar: Double
    
    enum CodingKeys: String, CodingKey {
        case date
        case rublesPerDollar = "rub"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        date = try values.decode(String.self, forKey: .date)
        rublesPerDollar = try values.decode(Double.self, forKey: .rublesPerDollar)
    }
}
