//
//  AuteurTableViewCell.swift
//  SelfSizingTableViewCells
//
//  Created by Alexander Kurbatov on 04.04.2022.
//

import UIKit

class AuteurTableViewCell: UITableViewCell {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
   lazy var bioLabel: UILabel = {
        let bioLabel = UILabel()
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return bioLabel
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return nameLabel
    }()
    
    lazy var sourceLabel: UILabel = {
        let sourceLabel = UILabel()
        sourceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return sourceLabel
    }()
    
    lazy var auteurImageView: UIImageView = {
        let auteurImageView = UIImageView()
        auteurImageView.translatesAutoresizingMaskIntoConstraints = false
        
        return auteurImageView
    }()
    
    func configure(
        name: String,
        bio: String,
        sourceText: String,
        imageName: String
    ) -> AuteurTableViewCell {
        
        self.contentView.addSubview(stackView)
        stackView.addArrangedSubview(auteurImageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(bioLabel)
        stackView.addArrangedSubview(sourceLabel)
        self.backgroundColor = UIColor(named: "AuteursBackground")
        
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        stackView.backgroundColor = UIColor(named: "AuteursBackground")
        
        nameLabel.text = name
        nameLabel.textColor = .systemGray2
        nameLabel.setContentHuggingPriority(UILayoutPriority(253), for: .vertical)
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.numberOfLines = 0
        
        bioLabel.text = bio
        bioLabel.textColor = .systemGray3
        bioLabel.numberOfLines = 0
        bioLabel.baselineAdjustment = .alignBaselines
        bioLabel.autoresizesSubviews = true
        bioLabel.setContentHuggingPriority(UILayoutPriority(252), for: .vertical)
        bioLabel.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
        bioLabel.adjustsFontForContentSizeCategory = true
//        bioLabel.numberOfLines = 0
        
        sourceLabel.text = sourceText
        sourceLabel.font = UIFont.systemFont(ofSize: 13)
        sourceLabel.textColor = .systemGray3
        sourceLabel.font = UIFont.italicSystemFont(ofSize: sourceLabel.font.pointSize)
        
        auteurImageView.image = UIImage(named: imageName)
        
        selectionStyle = .none
        setupCellConstraints()
        
        return self
    }

    func setupCellConstraints() {
        let aspectRatioConstraint = NSLayoutConstraint(item: auteurImageView, attribute: .height, relatedBy: .equal, toItem: auteurImageView, attribute: .width, multiplier: 1 / 1, constant: 0)
        aspectRatioConstraint.priority = UILayoutPriority(1000)
        auteurImageView.addConstraint(aspectRatioConstraint)
        NSLayoutConstraint.activate([aspectRatioConstraint])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
//            bioLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//            bioLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//            bioLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            bioLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
////            bioLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
////            bioLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
//            self.heightAnchor.constraint(equalToConstant: 450)
        ])
    }
    
    
    
}


