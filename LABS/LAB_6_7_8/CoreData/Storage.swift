//
//  Storage.swift
//  LABS
//
//  Created by Viktor Andreev on 15.04.2022.
//

import Foundation

enum StorageError: Error {
    case noData
}


protocol StorageProtocol {
    func save(rate: ExchangeRateData, completion: @escaping (Result<ExchangeRateData, Error>) -> Void)
    func obtainRate(completion: @escaping (Result<ExchangeRateData, Error>) -> Void)
}


final class Storage: StorageProtocol {
    
    // MARK: Private properties
    
    private let coreDataManager: CoreDataManagerProtocol
    private let storageRequestFactory: FetchRequestFactoryProtocol
    
    
    // MARK: Lifecycle
    
    init(coreDataManager: CoreDataManagerProtocol, storageRequestFactory: FetchRequestFactoryProtocol) {
        self.coreDataManager = coreDataManager
        self.storageRequestFactory = storageRequestFactory
    }
    
    
    // MARK: Internal
    
    func save(rate: ExchangeRateData, completion: @escaping (Result<ExchangeRateData, Error>) -> Void) {
        let context = coreDataManager.writeContext
        context.perform {
            _ = ExchangeRateDataModel.convert(dto: rate, into: context)
            do {
                try context.save()
                completion(.success(rate))
            } catch {
                assertionFailure("Error when saving context \(error)")
                context.rollback()
                completion(.failure(error))
            }
        }
    }
    
    func obtainRate(completion: @escaping (Result<ExchangeRateData, Error>) -> Void) {
        let context = coreDataManager.readContext
        context.perform { [weak self] in
            guard let strongSelf = self else { return }
            let request = strongSelf.storageRequestFactory.rateRequest()
            do {
                let fetchRequestResults = try context.fetch(request)
                guard let rate = fetchRequestResults.first else {
                    completion(.failure(StorageError.noData))
                    return
                }
                let dtoModel = rate.convertToDTO()
                completion(.success(dtoModel))
            } catch {
                assertionFailure("Failed to obtain forecast: \(error)")
                completion(.failure(error))
            }
        }
    }
}
