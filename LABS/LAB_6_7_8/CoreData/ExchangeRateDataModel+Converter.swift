//
//  ExchangeRateDataModel+Converter.swift
//  LABS
//
//  Created by Viktor Andreev on 08.04.2022.
//

import CoreData

extension ExchangeRateDataModel {
    
    static func convert(dto: ExchangeRateData, into context: NSManagedObjectContext) -> ExchangeRateDataModel {
        let model = ExchangeRateDataModel(context: context)
        model.date = dto.date
        model.rublesPerDollar = dto.rublesPerDollar
        return model
    }
    
    func convertToDTO() -> ExchangeRateData {
        ExchangeRateData(date: date ?? "", rublesPerDollar: rublesPerDollar)
    }
    
}
