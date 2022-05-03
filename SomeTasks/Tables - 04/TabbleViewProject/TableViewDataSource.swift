//
//  TableViewDataSource.swift
//  TabbleViewProject
//
//  Created by Alexander Kurbatov on 21.03.2022.
//

import UIKit

class TableViewDataSource<Model, Cell: UITableViewCell>: NSObject, UITableViewDataSource {
    
    typealias CellConfigurator = (Model, Cell) -> Void
    
    private let models: [Model]
    private let cellConfigurator: CellConfigurator
    
    init(
        models: [Model],
        cellConfigurator: @escaping CellConfigurator = { model, cell in }
    ) {
        self.models = models
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return models.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell: Cell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cellConfigurator(model, cell)
        return cell
    }
}

extension TableViewDataSource where Model == TransportModel, Cell == TransportTableViewCell {
    
    static func make(
        for transports: [TransportModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: transports
        ) { transport, cell in
            cell.update(with: transport)
        }
    }
}

extension TableViewDataSource where Model == DividerModel, Cell == DividerTableViewCell {
    
    static func make(
        for dividers: [DividerModel]
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: dividers
        )
    }
}
