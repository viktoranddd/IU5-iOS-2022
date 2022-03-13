//
//  ThirdViewController.swift
//  lab3
//
//  Created by Viktor Andreev on 12.03.2022.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var brightnessSlider: UISlider!
    @IBOutlet weak var sunImage: UIImageView!
    @IBOutlet weak var sunSwitch: UISwitch!
    @IBOutlet weak var colorControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var outletButton: UIButton!
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        helloLabel.isHidden = true
        sunImage.alpha = CGFloat(Float(brightnessSlider.value))
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeSlider(_ sender: Any) {
        let currentValue = Float(brightnessSlider.value)
        sunImage.alpha = CGFloat(currentValue)
    }
    
    @IBAction func changeSwitch(_ sender: Any) {
        sunImage.isHidden = !sunSwitch.isOn
        //print(sunSwitch.isOn)
    }
    
    @IBAction func changeControl(_ sender: Any) {
        if colorControl.selectedSegmentIndex == 0 {
            sunImage.tintColor = UIColor.systemYellow
        }
        else {
            sunImage.tintColor = UIColor.systemRed
        }
    }
    
    @IBAction func actionButton(_ sender: Any) {
        let name: String
        if nameTextField.text != "" {
            name = nameTextField.text!
        }
        else {
            name = "друг"
        }
        helloLabel.text = "Привет, " + name
        helloLabel.isHidden = false
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
