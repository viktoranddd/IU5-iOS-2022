//
//  ButtonModuleBuilder.swift
//  lab3
//
//  Created by Viktor Andreev on 25.03.2022.
//

import Foundation
import UIKit

final class ButtonModuleBuilder {
    
    func build(output: ButtonModuleOutput) -> UIViewController {
        let viewController = ButtonViewController()
        let presenter = ButtonPresenter()
        
        viewController.output = presenter
        presenter.view = viewController
        presenter.moduleOutput = output
        
        return viewController
    }
}
