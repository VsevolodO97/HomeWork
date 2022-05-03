//
//  ViewController.swift
//  TabbleViewProject
//
//  Created by Alexander Kurbatov on 15.03.2022.
//

import UIKit

enum TableViewIdentifier: String {
    case transport = "TransportCell"
    case divider = "DividerCell"
}

class ViewController: UIViewController {
    
    // MARK: - Data
    var transports: [TransportModel] = [TransportModel]()
    
    // MARK: - Table objects
    
    private lazy var tableDataSource: SectionedTableViewDataSource = SectionedTableViewDataSource(
        dataSources: [
            TableViewDataSource.make(for: transports),
            TableViewDataSource.make(for: [DividerModel()])
        ])
    
    // MARK: - Subviews
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.tableColor(.backgroundColor)
        return tableView
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTransportArray()
        
        view.backgroundColor = UIColor.tableColor(.backgroundColor)
        setupSubviews()
        setupConstraints()
   
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.indexPathsForSelectedRows?.forEach{ indexPath in
            tableView.deselectRow(at: indexPath, animated: animated)
        }
    }
    
    //MARK: - Tune subviews
    
    private func setupSubviews() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = tableDataSource
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(
            TransportTableViewCell.self,
            forCellReuseIdentifier: TableViewIdentifier.transport.rawValue
        )
        tableView.register(
            DividerTableViewCell.self,
            forCellReuseIdentifier: TableViewIdentifier.divider.rawValue
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
        
        let symbolConfig = UIImage.SymbolConfiguration(
            paletteColors: [
                UIColor.tableColor(.iconColor)!,
                .systemYellow
            ]
        )
        let sizeConf = UIImage.SymbolConfiguration(scale: .large)
        let config = symbolConfig.applying(sizeConf)
        
        transports.append(
            TransportModel(transportName: "Tram",
                      transportDescription: "Earth transport",
                      transportIcon: UIImage(systemName: "tram", withConfiguration: config)!)
        )
        transports.append(
            TransportModel(transportName: "Airplane",
                      transportDescription: "Air transport",
                      transportIcon: UIImage(systemName: "airplane", withConfiguration: config)!)
        )
        transports.append(
            TransportModel(transportName: "Ferry",
                      transportDescription: "River transport",
                      transportIcon: UIImage(systemName: "ferry", withConfiguration: config)!)
        )
        transports.append(
            TransportModel(transportName: "Bus",
                      transportDescription: "Sity transport",
                      transportIcon: UIImage(systemName: "bus", withConfiguration: config)!)
        )
        transports.append(
            TransportModel(transportName: "Car",
                      transportDescription: "Sity transport",
                      transportIcon: UIImage(systemName: "car", withConfiguration: config)!)
        )
    }

}

    // MARK: - Table extensions



extension ViewController: UITableViewDelegate {
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        indexPath.row == transports.count ? 88.0 : 66.0
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.tableColor(.backgroundColor)
//        viewController.title = transportIcons[indexPath.row]
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(
            navigationController,
            animated: true
        )
        // Dismiss controller after 1 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            navigationController.dismiss(animated: true)
        }
        
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

}
