//
//  TransportTableViewCell.swift
//  TabbleViewProject
//
//  Created by Alexander Kurbatov on 16.03.2022.
//

import UIKit

class TransportTableViewCell: UITableViewCell {
    
    
//    // MARK: - Properties
//    
//    var model: TransportModel? {
//        didSet {
//            textLabel?.text = model?.transportName
//            detailTextLabel?.text = model?.transportDescription
//            imageView?.image = model?.transportIcon
//        }
//    }
    
    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // .clear желательно не использовать, так как прозрачность - это дорогая операци с точки зрения рендеринга
//        backgroundColor = UIColor.tableColor(.backgroundColor)
//        contentView.backgroundColor = UIColor.tableColor(.backgroundColor)
//        textLabel?.backgroundColor = UIColor.tableColor(.backgroundColor)
//        detailTextLabel?.backgroundColor = UIColor.tableColor(.backgroundColor)
//        imageView?.backgroundColor = UIColor.tableColor(.backgroundColor)
        
//        let selectedView = UIView()
//        selectedView.backgroundColor = .systemYellow
//        selectedBackgroundView = selectedView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isHidden = false
        isSelected = false
        isHighlighted = false
    }
    
    // MARK: - Public
    
    func update(with model: TransportModel) {
        textLabel?.text = model.transportName
        detailTextLabel?.text = model.transportDescription
        imageView?.image = model.transportIcon
    }
    
}
