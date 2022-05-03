//
//  AuteurDetailViewController.swift
//  SelfSizingTableViewCells
//
//  Created by Alexander Kurbatov on 03.04.2022.
//

import UIKit

class AuteurDetailViewController: UIViewController {
    var selectedAuteur: Auteur?
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FilmTableViewCell.self, forCellReuseIdentifier: "FilmCell")
        return tableView
    }()
    
   
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
        title = selectedAuteur?.name
        self.tableView.contentInsetAdjustmentBehavior = .never
        view.backgroundColor = UIColor(named: "AuteursBackground")
        setupSubviews()
        setupConstraints()
    }
    
    // MARK: - Tune subviews
    
    private func setupSubviews() {
        view.addSubview(tableView)
//        tableView.addSubview(filmCell)
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

extension AuteurDetailViewController: UITableViewDataSource {
    
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   return selectedAuteur?.films.count ?? 0
  }

  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "FilmCell", for: indexPath
    )

    if
      let cell = cell as? FilmTableViewCell,
      let film = selectedAuteur?.films[indexPath.row] {
//       print(film)
      cell.configure(
        title: film.title,
        plot: film.plot,
        isExpanded: film.isExpanded,
        poster: film.poster
      )
    }
    return cell
  }
}

extension AuteurDetailViewController: UITableViewDelegate {
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    // 1
    guard
      let cell = tableView.cellForRow(at: indexPath) as? FilmTableViewCell,
      var film = selectedAuteur?.films[indexPath.row]
    else {
      return
    }
    // 2
    film.isExpanded.toggle()
    selectedAuteur?.films[indexPath.row] = film
    // 3

    cell.configure(
      title: film.title,
      plot: film.plot,
      isExpanded: film.isExpanded,
      poster: film.poster
    )

      DispatchQueue.main.asyncAfter(deadline: .now()) {
          tableView.beginUpdates()
          tableView.endUpdates()
          
          // 4
          tableView.scrollToRow(at: indexPath, at: .none, animated: false)
      }

  }
}
