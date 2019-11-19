//
//  BasicAnimalCellController.swift
//  ZooAnimals
//
//  Created by Gregory Keeley on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class BasicAnimalCellController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    
    var animals = [ZooAnimal]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    func loadData() {
        animals = ZooAnimal.zooAnimals
    }
}
extension BasicAnimalCellController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        let animal = animals[indexPath.row]
        cell.textLabel?.text = animal.name
        cell.detailTextLabel?.text = animal.origin
        cell.imageView?.image = UIImage(named: animal.imageNumber.description)
        return cell
    }
}
extension BasicAnimalCellController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
