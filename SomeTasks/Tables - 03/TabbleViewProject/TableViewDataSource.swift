import UIKit

class TableViewDataSource<Model>: NSObject, UITableViewDataSource {
    
    typealias CellConfigurator = (Model, UITableViewCell) -> Void
    
    var models: [Model]
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator

    init(
        models: [Model],
        reuseIdentifier: String,
        cellConfigurator: @escaping CellConfigurator = {models, cell in }
    ) {
        self.models = models
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        models.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        )
        
        cellConfigurator(model, cell)
        
        return cell
    }
}

extension TableViewDataSource where Model == TransportModel {
    
    static func make(
        for transports: [TransportModel],
reuseIdentifier: String = TableViewIdentifier.transport.rawValue
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: transports,
            reuseIdentifier: reuseIdentifier
        ) { transport, cell in
            guard
                let cell = cell as? TransportTableViewCell
            else {
                return
            }
            
            cell.update(with: transport)
        }
    }
}

extension TableViewDataSource where Model == DividerModel {
    
    static func make(
        for dividers: [DividerModel],
reuseIdentifier: String = TableViewIdentifier.divider.rawValue
    ) -> TableViewDataSource {
        TableViewDataSource(
            models: dividers,
            reuseIdentifier: reuseIdentifier
        )
    }
}
