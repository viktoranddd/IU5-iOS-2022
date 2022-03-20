//
//  InitialViewController.swift
//  lab3
//
//  Created by Viktor Andreev on 18.03.2022.
//

import Foundation
import UIKit

final class InitialViewController: UIViewController {
    
    private lazy var tableViewController: UITableView = {
        UITableView(frame: CGRect.zero, style: .grouped)
    }()
    
    private enum CellsDisplayData: String, CaseIterable {
        case lab3 = "Лабораторная работа 3"
        case lab4 = "Лабораторная работа 4"
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Лабораторные работы"
        view.backgroundColor = .systemGray
        setupTableView()
    }
    
    private func setupTableView() {
        view.addSubview(tableViewController)
        setupTableViewConstraints()
        tableViewController.delegate = self
        tableViewController.dataSource = self
        tableViewController.backgroundColor = .systemGray2
        tableViewController.tableHeaderView = UIView(frame: CGRect(x: 0,
                                                                   y: 0,
                                                                   width: tableViewController.frame.width,
                                                                   height: CGFloat.leastNormalMagnitude))
        registerCell()
    }
    
    private func registerCell() {
        tableViewController.register(InitialViewControllerCell.self, forCellReuseIdentifier: "InitialViewControllerCell")
    }
    
    private func setupTableViewConstraints() {
        tableViewController.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewController.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableViewController.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableViewController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewController.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        //tableViewController.contentInset = UIEdgeInsets(top: 200, left: 0, bottom: 0, right: 0)
    }
}

extension InitialViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let vc = UIStoryboard(name: "Main", bundle: .main).instantiateViewController(withIdentifier: "Lab3Storyboard")
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            let codedViewController = CodedViewController()
            navigationController?.pushViewController(codedViewController, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension InitialViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewController.dequeueReusableCell(withIdentifier: "InitialViewControllerCell", for: indexPath) as? InitialViewControllerCell else {
            fatalError()
        }
        cell.configure(text: CellsDisplayData.allCases[indexPath.row].rawValue)
        return cell
    }
    
}
