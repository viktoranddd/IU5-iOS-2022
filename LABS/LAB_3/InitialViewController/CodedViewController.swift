//
//  CodedViewController.swift
//  lab3
//
//  Created by Viktor Andreev on 19.03.2022.
//

import Foundation
import UIKit

final class CodedViewController: UIViewController {
    
    private lazy var tableButton: UIButton = {
        UIButton(frame: CGRect(x: view.frame.width/2-100,
                               y: view.frame.height/2-50,
                               width: 200,
                               height: 100))
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        title = "Тестовый экран"
        setupButton()
    }
    
    private func setupButton() {
        view.addSubview(tableButton)
        tableButton.backgroundColor = .systemBlue
        tableButton.setTitle("tableView", for: .normal)
        tableButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    @objc func tappedButton() {
        let codedSecondViewController = CodedSecondViewController()
        navigationController?.pushViewController(codedSecondViewController, animated: true)
        //let navigationViewController = UINavigationController(rootViewController: codedViewController)
    }
}
