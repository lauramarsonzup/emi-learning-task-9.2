//
//  AutoresListViewController.swift
//  LearningTask-9.2
//
//  Created by rafael.rollo on 22/07/2022.
//

import UIKit

class AutoresListViewController: UITableViewController {
    
    enum SegueType: String {
        case verDetalhesDoAutorSegue
        case verFormNovoAutorSegue
    }

    var autorAPI: AutoresAPI?
    var livrosAPI: LivrosAPI?
    
    var autores: [Autor] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        // Do any additional setup after loading the view.
    
        setupViews()
        carregaAutores()
    }

    private func setupViews() {
        tableView.register(TableSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: TableSectionHeaderView.reuseId)
        tableView.sectionHeaderHeight = TableSectionHeaderView.alturaBase
        tableView.sectionHeaderTopPadding = 0
    }
    
    private func carregaAutores() {
        guard let autorAPI = autorAPI else { return }
        self.autores = autorAPI.listaTodos()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier, let segueType = SegueType(rawValue: identifier) else { return }
        
        switch segueType {
        case .verDetalhesDoAutorSegue:
            guard let celula = sender as? AutorTableViewCell,
                  let autorViewController = segue.destination as? AutorViewController else {
                fatalError("Não foi possível executar segue \(segue.identifier!)")
            }
        
            autorViewController.livrosAPI = livrosAPI
            autorViewController.autor = celula.autor
            
        case .verFormNovoAutorSegue:
            guard let novoAutorViewController = segue.destination as? NovoAutorViewController else {
                fatalError("Não foi possível executar segue \(segue.identifier!)")
            }
            
            novoAutorViewController.delegate = self
        }
    
    }
    
}

extension AutoresListViewController: NovoAutorViewControllerDelegate {
    func novoAutorViewControllerDelegate(_ controller: NovoAutorViewController, adicionou autor: Autor) {
        autores.append(autor)
    }
    
}

// MARK: - UITableViewDataSource Implementations
extension AutoresListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return autores.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AutorTableViewCell", for: indexPath) as? AutorTableViewCell else {
            fatalError("Não foi possível obter celula para a lista de autores")
        }
        
        let autor = autores[indexPath.row]
        cell.autor = autor
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate Implementations
extension AutoresListViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableSectionHeaderView.reuseId) as? TableSectionHeaderView else {
            fatalError("Não foi possível obter view de header para a lista de autores.")
        }
        
        headerView.titulo = "Todos os Autores"
        return headerView
    }
    
}
