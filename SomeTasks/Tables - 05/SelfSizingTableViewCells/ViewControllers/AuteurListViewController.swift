//
//  AuteurListViewController.swift
//  SelfSizingTableViewCells
//
//  Created by Alexander Kurbatov on 03.04.2022.
//

import UIKit

class AuteurListViewController: UIViewController {
    let auteurs = Auteur.auteursFromBundle()
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(AuteurTableViewCell.self, forCellReuseIdentifier: "AuteurCell")
        return tableView
    }()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Auteurs"
        
        navigationController?.navigationBar.prefersLargeTitles = true
//        navigationController?
//            .navigationBar
//            .largeTitleTextAttributes =
//        [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 67, weight: .bold)]
        navigationItem.largeTitleDisplayMode = .automatic
        
        view.backgroundColor = UIColor(named: "AuteursBackground")
        setupSubviews()
        setupConstraints()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    // MARK: - Tune subviews
    
    private func setupSubviews() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "AuteursBackground")
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
}

    // MARK: - Table extentions

extension AuteurListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        auteurs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "AuteurCell",
            for: indexPath
        ) as? AuteurTableViewCell ?? AuteurTableViewCell(
            style: .default,
            reuseIdentifier: "AuteurCell"
        )
            let auteur = auteurs[indexPath.row]
        return cell.configure(
            name: auteur.name,
            bio: auteur.bio,
            sourceText: auteur.source,
            imageName: auteur.image
        )
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = AuteurDetailViewController()
        
        navigationController?.pushViewController(viewController, animated: true)
        viewController.selectedAuteur = auteurs[indexPath.row]
    }
}


