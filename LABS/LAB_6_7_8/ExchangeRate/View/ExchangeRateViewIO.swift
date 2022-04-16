//
//  ExchangeRateViewIO.swift
//  LABS
//
//  Created by Viktor Andreev on 15.04.2022.
//

import Foundation

protocol ExchangeRateViewInput: AnyObject {
    func reloadData(rate: ExchangeRateData)
    func showAlert(title: String, message: String)
}

protocol ExchangeRateViewOutput: AnyObject {
    func viewDidLoad()
}
