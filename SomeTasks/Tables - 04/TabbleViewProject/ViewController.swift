//
//  ViewController.swift
//  TabbleViewProject
//
//  Created by Alexander Kurbatov on 15.03.2022.
//

import UIKit

/// Подчиненный
class TransportsTableCellDelegate: CellActionDelegate<TransportModel> {
    
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
        
        super.init()
    }

    override func didSelect(model: TransportModel) {
        let nextViewController = UIViewController()
        nextViewController.view.backgroundColor = UIColor.tableColor(.backgroundColor)
        nextViewController.title = model.transportName
        let navigationController = UINavigationController(rootViewController: nextViewController)
        navigationController.modalPresentationStyle = .fullScreen

        viewController?.present(
            navigationController,
            animated: true
        )

        // Dismiss controller after 1 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            navigationController.dismiss(animated: true)
        }
    }
}

class ViewController: UIViewController {
    
    // MARK: - Data
    
    var transports: [TransportModel] = [TransportModel]()
    
    // MARK: - Table oblects

    private lazy var tableData: SectionedTableViewDataSource = SectionedTableViewDataSource(
        dataSources: [
            TableViewDataSource.make(for: transports),
            TableViewDataSource.make(for: [DividerModel()])
    ])
    
    private lazy var tableActions: TableViewDelegate = { [unowned self] in
        TableViewDelegate(
            models: transports,
            cellActionDelegate: TransportsTableCellDelegate(viewController: self)
        )
    }()
    
    
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
        tableView.delegate = tableActions
        tableView.dataSource = tableData
        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TransportTableViewCell.self)
        tableView.register(DividerTableViewCell.self)
    }

    //MARK: - Layout
    
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
