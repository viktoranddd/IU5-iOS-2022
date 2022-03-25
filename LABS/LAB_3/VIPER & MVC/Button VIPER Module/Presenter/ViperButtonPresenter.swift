//
//  ViperButtonPresenter.swift
//  lab3
//
//  Created by Viktor Andreev on 25.03.2022.
//

import Foundation

final class ViperButtonPresenter {
    
    weak var view: ViperButtonViewInput!
    weak var moduleOutput: ViperButtonModuleOutput!
    
    var interactor: ViperButtonInteractorInput
    
    init(interactor: ViperButtonInteractorInput) {
        self.interactor = interactor
    }
    
}

extension ViperButtonPresenter: ViperButtonViewOutput {
    func userDidTapTableButton() {
        moduleOutput?.tableButtonWasTapped()
    }
    
    
}

extension ViperButtonPresenter: ViperButtonViewInput {
    
}

extension ViperButtonPresenter: ViperButtonInteractorOutput {
    
}
