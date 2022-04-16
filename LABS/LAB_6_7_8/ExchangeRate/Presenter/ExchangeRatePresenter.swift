//
//  ExchangeRatePresenter.swift
//  LABS
//
//  Created by Viktor Andreev on 15.04.2022.
//

import Foundation

final class ExchangeRatePresenter {
    
    // MARK: Private properties
    
    private let interactor: ExchangeRateInteractorInput
    //private let displayDataFactory: WeatherDisplayDataFactoryProtocol
    private var rate: ExchangeRateData?
    
    
    // MARK: Internal properties
    
    weak var view: ExchangeRateViewInput?
    
    
    // MARK: Lifecycle
    
    init(interactor: ExchangeRateInteractorInput) {
        self.interactor = interactor
        //self.displayDataFactory = displayDataFactory
    }
}


// MARK: - ExchangeRateViewOutput

extension ExchangeRatePresenter: ExchangeRateViewOutput {
    
    func viewDidLoad() {
        interactor.loadData()
    }
    
}


// MARK: - ExchangeRateInteractorOutput

extension ExchangeRatePresenter: ExchangeRateInteractorOutput {
    func didFetchRate(_ exchangeRate: ExchangeRateData) {
        rate = exchangeRate
        view?.reloadData(rate: rate!)
    }
    
    func didReceiveError(_ error: Error) {
        view?.showAlert(title: "Ошибка", message: "Кэш отсутствует!")
    }
    

}


// MARK: - ExchangeRateModuleInput

extension ExchangeRatePresenter: ExchangeRateModuleInput {
    
}
