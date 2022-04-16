//
//  FetchRequestFactory.swift
//  LABS
//
//  Created by Viktor Andreev on 15.04.2022.
//

import Foundation
import CoreData

protocol FetchRequestFactoryProtocol {
    func ExchangeRateDataRequest() -> NSFetchRequest<ExchangeRateDataModel>
    func removeAllRequests() -> NSBatchDeleteRequest
    func rateRequest() -> NSFetchRequest<ExchangeRateDataModel>
}

final class FetchRequestFactory: FetchRequestFactoryProtocol {
    func ExchangeRateDataRequest() -> NSFetchRequest<ExchangeRateDataModel> {
        let request = NSFetchRequest<ExchangeRateDataModel>(entityName: ExchangeRateDataModel.entity().name ?? "")
        return request
    }
    
    func removeAllRequests() -> NSBatchDeleteRequest {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: ExchangeRateDataModel.entity().name ?? "")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        return deleteRequest
    }
    
    func rateRequest() -> NSFetchRequest<ExchangeRateDataModel> {
        let request = ExchangeRateDataModel.fetchRequest()
        return request
    }
}
