//
//  AutorTableViewCell.swift
//  LearningTask-9.2
//
//  Created by rafael.rollo on 22/07/2022.
//

import UIKit

class AutorTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var tecnologiasLabel: UILabel!

    var autor: Autor? {
        didSet {
            guard let autor = autor else { return }

            nomeLabel.text = autor.nomeCompleto
            tecnologiasLabel.text = autor.tecnologias.joined(separator: ", ")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .texasRose.withAlphaComponent(0.3)
        selectedBackgroundView = bgColorView
    }
    
}
