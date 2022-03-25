//
//  ViperComponentsViewController.swift
//  lab3
//
//  Created by Viktor Andreev on 25.03.2022.
//

import Foundation
import UIKit

final class ViperComponentsViewController: UIViewController {
    
    private let firstLabel = UILabel()
    private let textField = UITextField()
    private let nameButton = UIButton()
    private let nameLabel = UILabel()
    private let sunImage = UIImageView()
    private let secondLabel = UILabel()
    private let brightnessSlider = UISlider()
    private let thirdLabel = UILabel()
    private let sunSwitch = UISwitch()
    private let fourthLabel = UILabel()
    private let colorControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstLabel()
        setupTextField()
        setupNameButton()
        setupNameLabel()
        setupSunImage()
        setupSecondLabel()
        setupBrightnessSlider()
        setupThirdLabel()
        setupSunSwitch()
        setupFourthLabel()
        setupColorControl()
    }
    
    private func setupFirstLabel() {
        firstLabel.text = "Введите имя и нажмите на кнопку"
        firstLabel.font = .systemFont(ofSize: 18)
        view.addSubview(firstLabel)
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            firstLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
    }
    
    private func setupTextField() {
        textField.borderStyle = .roundedRect
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.widthAnchor.constraint(equalToConstant: 200),
            textField.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 10),
            textField.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: 30)
        ])
    }
    
    private func setupNameButton() {
        nameButton.setTitle("Нажми на меня!", for: .normal)
        nameButton.backgroundColor = .systemBlue
        view.addSubview(nameButton)
        nameButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameButton.widthAnchor.constraint(equalToConstant: 150),
            nameButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            nameButton.bottomAnchor.constraint(equalTo: nameButton.topAnchor, constant: 30)
        ])
        nameButton.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
    }
    
    private func setupNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: nameButton.bottomAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 30)
        ])
    }
    
    @objc func tappedButton() {
        let name: String
        if textField.text != "" {
            name = textField.text!
        }
        else {
            name = "друг"
        }
        nameLabel.text = "Привет, " + name
    }
    
    private func setupSunImage() {
        sunImage.image = UIImage(systemName: "sun.max.fill")!
        sunImage.tintColor = .systemYellow
        view.addSubview(sunImage)
        sunImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sunImage.widthAnchor.constraint(equalToConstant: 150),
            sunImage.heightAnchor.constraint(equalToConstant: 150),
            sunImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            //sunImage.bottomAnchor.constraint(equalTo: sunImage.topAnchor, constant: 200)
        ])
    }
    
    private func setupSecondLabel() {
        secondLabel.text = "Настройка насыщенности цвета"
        secondLabel.font = .systemFont(ofSize: 18)
        view.addSubview(secondLabel)
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondLabel.topAnchor.constraint(equalTo: sunImage.bottomAnchor, constant: 10),
            secondLabel.bottomAnchor.constraint(equalTo: secondLabel.topAnchor, constant: 30)
        ])
    }
    
    private func setupBrightnessSlider() {
        brightnessSlider.minimumValueImage = UIImage(systemName: "sun.min.fill")!
        brightnessSlider.maximumValueImage = UIImage(systemName: "sun.max.fill")!
        brightnessSlider.value = Float(sunImage.alpha)
        //sunImage.alpha = CGFloat(Float(brightnessSlider.value))
        view.addSubview(brightnessSlider)
        brightnessSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            brightnessSlider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            brightnessSlider.widthAnchor.constraint(equalToConstant: 200),
            brightnessSlider.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 10),
            brightnessSlider.bottomAnchor.constraint(equalTo: brightnessSlider.topAnchor, constant: 30)
        ])
        brightnessSlider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
    }
    
    @objc func changeSlider() {
        sunImage.alpha = CGFloat(brightnessSlider.value)
    }
    
    private func setupThirdLabel() {
        thirdLabel.text = "Вкл/выкл отображение"
        thirdLabel.font = .systemFont(ofSize: 18)
        view.addSubview(thirdLabel)
        thirdLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdLabel.topAnchor.constraint(equalTo: brightnessSlider.bottomAnchor, constant: 10),
            thirdLabel.bottomAnchor.constraint(equalTo: thirdLabel.topAnchor, constant: 30)
        ])
    }
    
    private func setupSunSwitch() {
        sunSwitch.isOn = true
        view.addSubview(sunSwitch)
        sunSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sunSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sunSwitch.topAnchor.constraint(equalTo: thirdLabel.bottomAnchor, constant: 10)
        ])
        sunSwitch.addTarget(self, action: #selector(changeSwitch), for: .valueChanged)
    }
    
    @objc func changeSwitch() {
        sunImage.isHidden = !sunSwitch.isOn
    }
    
    private func setupFourthLabel() {
        fourthLabel.text = "Выбор цвета"
        fourthLabel.font = .systemFont(ofSize: 18)
        view.addSubview(fourthLabel)
        fourthLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fourthLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fourthLabel.topAnchor.constraint(equalTo: sunSwitch.bottomAnchor, constant: 10),
            fourthLabel.bottomAnchor.constraint(equalTo: fourthLabel.topAnchor, constant: 30)
        ])
    }
    
    private func setupColorControl() {
        colorControl.insertSegment(withTitle: "Желтый", at: 0, animated: false)
        colorControl.insertSegment(withTitle: "Красный", at: 1, animated: false)
        colorControl.selectedSegmentIndex = 0
        view.addSubview(colorControl)
        colorControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            colorControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorControl.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            colorControl.topAnchor.constraint(equalTo: fourthLabel.bottomAnchor, constant: 10)
        ])
        colorControl.addTarget(self, action: #selector(changeControl), for: .valueChanged)
    }
    
    @objc func changeControl() {
        if colorControl.selectedSegmentIndex == 0 {
            sunImage.tintColor = UIColor.systemYellow
        }
        else {
            sunImage.tintColor = UIColor.systemRed
        }
    }
}
