//
//  ViewController.swift
//  lab3
//
//  Created by Viktor Andreev on 11.03.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Тестовый экран"
    }
    
    @IBAction func pushButton(_ sender: Any) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secondViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }

}

