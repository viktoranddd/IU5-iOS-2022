//
//  ExchangeRateViewController.swift
//  LABS
//
//  Created by Viktor Andreev on 04.04.2022.
//

import Foundation
import UIKit

final class ExchangeRateViewController: UIViewController {
    
    private let showExchangeRateButton = UIButton()
    private let dateLabel = UILabel()
    private let exchangeRateLabel = UILabel()
    private var networkService: NetworkServiceProtocol!
    private var requestFactory: NetworkRequestFactoryProtocol!
    private var currentDate: String = "Нет даты"
    private var currentExchangeRate: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestFactory = NetworkRequestFactory()
        networkService = NetworkService(session: URLSession(configuration: .default))
        
        title = "Курс доллара"
        view.backgroundColor = .systemGray
        setupShowExchangeRateButton()
        setupDateLabel()
        setupExchangeRateLabel()
    }
    
    private func setupShowExchangeRateButton() {
        view.addSubview(showExchangeRateButton)
        showExchangeRateButton.backgroundColor = .systemBlue
        showExchangeRateButton.setTitle("Показать курс доллара", for: .normal)
        showExchangeRateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showExchangeRateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showExchangeRateButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            showExchangeRateButton.widthAnchor.constraint(equalToConstant: 300),
            showExchangeRateButton.heightAnchor.constraint(equalToConstant: 100)
        ])
        showExchangeRateButton.addTarget(self, action: #selector(ShowExchangeRate), for: .touchUpInside)
    }
    
    func setupDateLabel() {
        view.addSubview(dateLabel)
        dateLabel.isHidden = true
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: showExchangeRateButton.bottomAnchor, constant: 20),
        ])
    }
    
    func setupExchangeRateLabel() {
        view.addSubview(exchangeRateLabel)
        exchangeRateLabel.isHidden = true
        exchangeRateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exchangeRateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            exchangeRateLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 20),
        ])
    }
    
    func setupNewValues(exchangeRateData: ExchangeRateData) {
        dateLabel.text = "Дата: " + exchangeRateData.date
        dateLabel.isHidden = false
        exchangeRateLabel.text = "Курс: " + String(exchangeRateData.rublesPerDollar)
        exchangeRateLabel.isHidden = false
    }
    
    @objc
    func ShowExchangeRate() {
        let request = requestFactory.getExchangeRate()
        networkService.sendRequest(request) { [weak self] result in
            switch result {
            case .failure(let error):
                print ("Error: \(error)")
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let exchangeRateData = try decoder.decode(ExchangeRateData.self, from: data)
                    self?.setupNewValues(exchangeRateData: exchangeRateData)
                } catch {
                    assertionFailure("\(error)")
                }
                
            }
        }
    }
}
