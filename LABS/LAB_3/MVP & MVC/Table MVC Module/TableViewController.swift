//
//  CodedSecondViewController.swift
//  lab3
//
//  Created by Viktor Andreev on 19.03.2022.
//

import Foundation
import UIKit

final class TableViewController: UIViewController {
    
    private lazy var tableViewController: UITableView = {
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
        view.addSubview(tableViewController)
        setupTableViewConstraints()
        tableViewController.delegate = self
        tableViewController.dataSource = self
        tableViewController.backgroundColor = .systemGray2
        setupHeader()
        tableViewController.tableHeaderView = header
        setupFooter()
        tableViewController.tableFooterView = footer
        /*
        tableViewController.tableFooterView = UIView(frame: CGRect(x: 0,
                                                                   y: 0,
                                                                   width: view.frame.width,
                                                                   height: 50))
        tableViewController.tableFooterView?.backgroundColor = .blue
         */
        registerCell()
        
    }
    
    private func setupTableViewConstraints() {
        tableViewController.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableViewController.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableViewController.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableViewController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableViewController.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
        tableViewController.register(TableViewControllerCell.self, forCellReuseIdentifier: "TableViewControllerCell")
    }
    
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let componentsViewController = ComponentsViewController()
        componentsViewController.view.backgroundColor = .white
        navigationController?.pushViewController(componentsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableViewController.dequeueReusableCell(withIdentifier: "TableViewControllerCell", for: indexPath) as? TableViewControllerCell else {
            fatalError()
        }
        cell.configure(with: "Title " + String(indexPath.row + 1), image: UIImage(systemName: "sparkle")!)
        return cell
    }
    
}
