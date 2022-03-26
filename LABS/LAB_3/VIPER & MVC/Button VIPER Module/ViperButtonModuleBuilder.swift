//
//  ViperButtonModuleBuilder.swift
//  lab3
//
//  Created by Viktor Andreev on 25.03.2022.
//

import Foundation
import UIKit

final class ViperButtonModuleBuilder {
    func build(output: ViperButtonModuleOutput) -> UIViewController {
        let viewController = ViperButtonViewController()
        let interactor = ViperButtonInteractor()
        let presenter = ViperButtonPresenter(interactor: interactor)
        
        viewController.output = presenter
        presenter.view = viewController
        presenter.moduleOutput = output
        interactor.output = presenter
        
        return viewController
    }
}
