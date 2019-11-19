//
//  CustomCellViewController.swift
//  ZooAnimals
//
//  Created by Gregory Keeley on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CustomCellViewController: UIViewController {
    // cell reuse ID: customCell
    
    @IBOutlet weak var tableView: UITableView!
    
    var animals = [ZooAnimal]() {
        didSet {
            tableView.reloadData()
        }
    }
    
//MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
        
    }
//MARK: Functions
    func loadData() {
        animals = ZooAnimal.zooAnimals
    }
}
//MARK: UITableViewDataSource Extension
extension CustomCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? AnimalCell else {
            fatalError("failed to dequeue \"AnimalCell")
            
        }
        let animal = animals[indexPath.row]
        cell.configureCell(for: animal)
        return cell
    }
}
//MARK: UITableViewDelegate Extension
extension CustomCellViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
