//
//  TableSectionHeaderView.swift
//  LearningTask-9.2
//
//  Created by rafael.rollo on 22/07/2022.
//

import UIKit

class TableSectionHeaderView: UITableViewHeaderFooterView {
    
    static var reuseId: String {
        return String(describing: self)
    }
    
    static let alturaBase: CGFloat = 42
    
    private lazy var tituloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    var titulo: String? {
        didSet {
            tituloLabel.text = titulo
        }
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addTheme()
        addViews()
        addConstraints()
    }
    
    private func addTheme() {
        contentView.backgroundColor = .texasRose.withAlphaComponent(0.75)
    }
    
    private func addViews() {
        addSubview(tituloLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: Self.alturaBase)
        ])
        
        NSLayoutConstraint.activate([
            tituloLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            tituloLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            tituloLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }

}

