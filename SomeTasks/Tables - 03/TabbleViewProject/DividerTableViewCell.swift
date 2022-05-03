//
//  DividerTableViewCell.swift
//  TabbleViewProject
//
//  Created by Alexander Kurbatov on 20.03.2022.
//

import UIKit

class DividerTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemBrown
        contentView.backgroundColor = .systemBrown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
