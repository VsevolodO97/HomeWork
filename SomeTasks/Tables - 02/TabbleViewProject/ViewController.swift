//
//  ViewController.swift
//  TabbleViewProject
//
//  Created by Alexander Kurbatov on 15.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Data
    
    fileprivate let transportIcons: [String] = ["Train", "Airplane", "Ferry", "Bus", "Car"]
    var transports: [CellModel] = [CellModel]()
    
    // MARK: - Subviews
    
    fileprivate enum TableViewIdentifier: String {
        case transport = "TransportCell"
        case separator = "SeparatorCel"
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .secondarySystemBackground
        return tableView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTransportArray()
        
        view.backgroundColor = .systemBackground
        setupSubviews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.indexPathsForSelectedRows?.forEach { indexPath in
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
    
    // MARK: - Tune subviews
    
    private func setupSubviews() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.allowsSelection = true
        tableView.register(
            TransportTableViewCell.self,
            forCellReuseIdentifier: TableViewIdentifier.transport.rawValue
        )
        tableView.register(
            SeparatorTableViewCell.self,
            forCellReuseIdentifier: TableViewIdentifier.separator.rawValue
        )
    }

    // MARK: - Layout
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        
        ])
    }
    
    private func createTransportArray() {
        transports.append(
            CellModel(transportName: "Tram",
                      transportDescription: "Earth transport",
                      transportIcon: UIImage(systemName: "tram")!)
        )
        // TODO: перейти на конфигурацию для SF Image
        transports.append(
            CellModel(transportName: "Airplane",
                      transportDescription: "Air transport",
                      transportIcon: UIImage(systemName: "airplane", withConfiguration: nil)!)
        )
        transports.append(
            CellModel(transportName: "Ferry",
                      transportDescription: "River transport",
                      transportIcon: UIImage(systemName: "ferry")!)
        )
        transports.append(
            CellModel(transportName: "Bus",
                      transportDescription: "Sity transport",
                      transportIcon: UIImage(systemName: "bus")!)
        )
        transports.append(
            CellModel(transportName: "Car",
                      transportDescription: "Sity transport",
                      transportIcon: UIImage(systemName: "car")!)
        )
    }

}

    // MARK: - Table extensions

extension ViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        transports.count + 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        if indexPath.row == transports.count {
            guard
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: TableViewIdentifier.separator.rawValue,
                    for: indexPath
                ) as? SeparatorTableViewCell
            else {
                fatalError()
            }
            
            return cell
        }
        
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: TableViewIdentifier.transport.rawValue,
                for: indexPath
            ) as? TransportTableViewCell
        else {
            fatalError()
        }
        
        // configure the cell's contents
//        cell.model = transports[indexPath.row]
        cell.update(with: transports[indexPath.row])
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        if indexPath.row == transports.count {
            return 100.0
        }
        
        return 44.0
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
//        let viewController = UIViewController()
//        viewController.view.backgroundColor = .systemGreen
//        viewController.title = transportIcons[indexPath.row]
//        let navigationController = UINavigationController(rootViewController: viewController)
//        navigationController.modalPresentationStyle = .fullScreen
//        present(
//            navigationController,
//            animated: true
//        )
//        // Dismiss controller after 1 sec
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            navigationController.dismiss(animated: true)
//        }
        
//        let alert = UIAlertController(
//            title: transportIcons[indexPath.row],
//            message: nil,
//            preferredStyle: .alert
//        )
//        let action = UIAlertAction(
//            title: "Close",
//            style: .cancel
//        )
//        alert.addAction(action)
//        present(alert, animated: true)
    }
    
    func tableView(
        _ tableView: UITableView,
        didDeselectRowAt indexPath: IndexPath
    ) {
        print("Deselected cell at \(indexPath)")
    }

}
