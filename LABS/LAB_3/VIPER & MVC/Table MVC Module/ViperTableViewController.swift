//
//  ViperTableViewController.swift
//  lab3
//
//  Created by Viktor Andreev on 25.03.2022.
//

import Foundation
import UIKit

final class ViperTableViewController: UIViewController {
    
    private lazy var viperTableViewController: UITableView = {
        UITableView(frame: CGRect.zero, style: .plain)
    }()
    
    private let header = UIView()
    private let textHeader = UILabel()
    private let footer = UIView()
    private let textFooter = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TableView"
        view.backgroundColor = .systemGray
        setupTable()
    }
    
    private func setupTable() {
        view.addSubview(viperTableViewController)
        setupTableViewConstraints()
        viperTableViewController.delegate = self
        viperTableViewController.dataSource = self
        viperTableViewController.backgroundColor = .systemGray2
        setupHeader()
        viperTableViewController.tableHeaderView = header
        setupFooter()
        viperTableViewController.tableFooterView = footer
        registerCell()
        
    }
    
    private func setupTableViewConstraints() {
        viperTableViewController.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            viperTableViewController.leftAnchor.constraint(equalTo: view.leftAnchor),
            viperTableViewController.rightAnchor.constraint(equalTo: view.rightAnchor),
            viperTableViewController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            viperTableViewController.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setupHeader() {
        view.addSubview(header)
        header.backgroundColor = .brown
        header.frame = CGRect(x: 0,
                              y: 0,
                              width: view.frame.width,
                              height: 50)
        header.addSubview(textHeader)
        textHeader.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textHeader.centerXAnchor.constraint(equalTo: header.centerXAnchor),
            textHeader.centerYAnchor.constraint(equalTo: header.centerYAnchor)
        ])
        textHeader.text = "Header"
    }
    
    private func setupFooter() {
        view.addSubview(footer)
        footer.backgroundColor = .brown
        footer.frame = CGRect(x: 0,
                              y: 0,
                              width: view.frame.width,
                              height: 50)
        footer.addSubview(textFooter)
        textFooter.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textFooter.centerXAnchor.constraint(equalTo: footer.centerXAnchor),
            textFooter.centerYAnchor.constraint(equalTo: footer.centerYAnchor)
        ])
        textFooter.text = "Footer"
    }
    
    private func registerCell() {
        viperTableViewController.register(TableViewControllerCell.self, forCellReuseIdentifier: "ViperTableViewControllerCell")
    }
    
}

extension ViperTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viperComponentsViewController = ViperComponentsViewController()
        viperComponentsViewController.view.backgroundColor = .white
        navigationController?.pushViewController(viperComponentsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ViperTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = viperTableViewController.dequeueReusableCell(withIdentifier: "ViperTableViewControllerCell", for: indexPath) as? ViperTableViewControllerCell else {
            fatalError()
        }
        cell.configure(with: "Title " + String(indexPath.row + 1), image: UIImage(systemName: "sparkle")!)
        return cell
    }
    
}
