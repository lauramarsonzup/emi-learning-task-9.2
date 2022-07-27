//
//  TecnologiaViewCell.swift
//  LearningTask-9.2
//
//  Created by rafael.rollo on 25/07/2022.
//

import UIKit

class TecnologiaViewCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    
    var tecnologia: String? {
        didSet {
            tituloLabel.text = tecnologia
        }
    }
    
}
