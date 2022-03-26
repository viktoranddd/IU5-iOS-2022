//
//  ButtonPresenter.swift
//  lab3
//
//  Created by Viktor Andreev on 25.03.2022.
//

import Foundation

final class ButtonPresenter {
    
    weak var view: ButtonViewInput!
    weak var moduleOutput: ButtonModuleOutput!
    
    
}

extension ButtonPresenter: ButtonViewOutput {
    
    func tappedTableButton() {
        moduleOutput?.buttonWasTapped()
    }
    
}
