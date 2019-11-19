//
//  AnimalCell.swift
//  ZooAnimals
//
//  Created by Gregory Keeley on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {

    @IBOutlet weak var animalNameLabel: UILabel!
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var animalImage: UIImageView!
    
    func configureCell(for animal: ZooAnimal) {
        animalImage.image = UIImage(named: animal.imageNumber.description)
        animalNameLabel.text = animal.name
        classificationLabel.text = animal.classification
        originLabel.text = animal.origin
    }


}
