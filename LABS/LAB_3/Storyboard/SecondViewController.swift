//
//  SecondViewController.swift
//  lab3
//
//  Created by Viktor Andreev on 11.03.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        title = "TableView"
        super.viewDidLoad()
        
        setUptable()
        // Do any additional setup after loading the view.
    }
    
    private func setUptable() {
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.register(TestCell.self, forCellReuseIdentifier: "сell")
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


extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "thirdViewController")
        navigationController?.pushViewController(viewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        //print("Tapped" + String(indexPath.row))
    }
}



extension SecondViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as? TestCell
        cell?.configure(with: "Title " + String(indexPath.row + 1), image: UIImage(systemName: "sparkle")!)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

/*
extension SecondViewController: UITableViewController {
    
}
 */
