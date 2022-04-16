//
//  ExchangeRateInteractor.swift
//  LABS
//
//  Created by Viktor Andreev on 15.04.2022.
//

import Foundation

final class ExchangeRateInteractor {
    
    // MARK: Private properties
    
    private let networkRequestFactory: NetworkRequestFactoryProtocol
    private let networkService: NetworkServiceProtocol
    private let storage: StorageProtocol
    
    
    // MARK: Internal properties
    
    weak var output: ExchangeRateInteractorOutput!
    
    
    // MARK: Lifecycle
    
    init(networkRequestFactory: NetworkRequestFactoryProtocol,
         networkService: NetworkServiceProtocol,
         storage: StorageProtocol) {
        self.networkRequestFactory = networkRequestFactory
        self.networkService = networkService
        self.storage = storage
    }
    
    
    // MARK: - Private
    
    private func saveExchangeRate(_ rate: ExchangeRateData) {
        storage.save(rate: rate) { result in
            switch result {
            case .failure(let error):
                print("Всё пропало \(error)")
                
            case .success:
                break
            }
        }
    }
    
    private func obtainRateFromCache(completion: @escaping (Result<ExchangeRateData, Error>) -> Void) {
        storage.obtainRate(completion: completion)
    }
    
    private func obtainRateDataFromServer() {
        let networkRequest = networkRequestFactory.getExchangeRate()
        networkService.sendRequest(networkRequest) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .failure(let error):
                assertionFailure("Error: \(error)")
                strongSelf.output.didReceiveError(error)
                
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let rate = try decoder.decode(ExchangeRateData.self, from: data)
                    strongSelf.saveExchangeRate(rate)
                    strongSelf.output.didFetchRate(rate)
                } catch {
                    assertionFailure("Error: \(error)")
                    strongSelf.output.didReceiveError(error)
                }
            }
        }
    }
}


// MARK: - ExchangeRateInteractorInput

extension ExchangeRateInteractor: ExchangeRateInteractorInput {
    func loadData() {
        obtainRateFromCache() { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let rate):
                strongSelf.output.didFetchRate(rate)
                
            case .failure(let error):
                strongSelf.output.didReceiveError(error)
            }
            strongSelf.obtainRateDataFromServer()
        }
    }
}
