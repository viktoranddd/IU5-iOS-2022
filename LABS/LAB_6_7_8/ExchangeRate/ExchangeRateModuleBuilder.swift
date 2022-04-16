//
//  ExchangeRateModuleBuilder.swift
//  LABS
//
//  Created by Viktor Andreev on 15.04.2022.
//

import Foundation
import UIKit

final class ExchangeRateModuleBuilder {
    
    func build() -> UIViewController {
        let viewController = ExchangeRateViewController()
        
        let networkRequestFactory = NetworkRequestFactory()
        let networkService = NetworkService(session: URLSession.shared)
        let coreDataManager = CoreDataManager()
        let storageRequestFactory = FetchRequestFactory()
        let storage = Storage(
            coreDataManager: coreDataManager,
            storageRequestFactory: storageRequestFactory
        )
        let interactor = ExchangeRateInteractor(
            networkRequestFactory: networkRequestFactory,
            networkService: networkService,
            storage: storage
        )
        
        let presenter = ExchangeRatePresenter(
            interactor: interactor
        )
        
        interactor.output = presenter
        presenter.view = viewController
        viewController.output = presenter
        
        return viewController
    }
}
