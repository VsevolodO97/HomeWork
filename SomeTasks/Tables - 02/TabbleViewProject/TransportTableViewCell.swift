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
//    var model: CellModel? {
//        didSet {
//            textLabel?.text = model?.transportName
//            detailTextLabel?.text = model?.transportDescription
//            imageView?.image = model?.transportIcon
//        }
//    }

    // MARK: - Lifecycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // TODO: перейти на семантические цвета (assets)
//        backgroundColor = .secondarySystemBackground
//        contentView.backgroundColor = .secondarySystemBackground
//        textLabel?.backgroundColor = .secondarySystemBackground
//        detailTextLabel?.backgroundColor = .secondarySystemBackground
//        imageView?.backgroundColor = .secondarySystemBackground
        
        let blueView = UIView()
        blueView.backgroundColor = .blue.withAlphaComponent(0.5)
        selectedBackgroundView = blueView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        isHidden = false
    }
    
    // MARK: - Public
    
    func update(with model: CellModel) {
        textLabel?.text = model.transportName
        detailTextLabel?.text = model.transportDescription
        imageView?.image = model.transportIcon
    }
}
