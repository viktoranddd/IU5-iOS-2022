//
//  ExchangeRateInteractorIO.swift
//  LABS
//
//  Created by Viktor Andreev on 15.04.2022.
//

import Foundation

protocol ExchangeRateInteractorInput: AnyObject {
    func loadData()
}

protocol ExchangeRateInteractorOutput: AnyObject {
    func didFetchRate(_ exchangeRate: ExchangeRateData)
    func didReceiveError(_ error: Error)
}
