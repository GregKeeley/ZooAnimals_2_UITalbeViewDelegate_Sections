//
//  AnimalSectionsViewController.swift
//  ZooAnimals
//
//  Created by Gregory Keeley on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class AnimalSectionsViewController: UIViewController {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var animalClassifications = [[ZooAnimal]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        loadData()
    }
    func loadData() {
        animalClassifications = ZooAnimal.classificationSections()
    }
}

//MARK: Data Source delegate
extension AnimalSectionsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalClassifications[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalSectionCell", for: indexPath) as? AnimalCell else {
            fatalError("failed to dequeue properly")
        }
        let animal = animalClassifications[indexPath.section][indexPath.row]
        cell.configureCell(for: animal)
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return animalClassifications.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return animalClassifications[section].first?.classification
    }
}

// MARK: TableView Delegate
extension AnimalSectionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return animalClassifications[]
//    }
}
