//
//  Alert+UIViewController.swift
//  LearningTask-9.2
//
//  Created by rafael.rollo on 25/07/2022.
//

import UIKit

extension UIViewController {
    
    func exibeAlerta(titulo: String?, mensagem: String?) {
        let alert = UIAlertController(
            title: titulo,
            message: mensagem,
            preferredStyle: .alert
        )
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
