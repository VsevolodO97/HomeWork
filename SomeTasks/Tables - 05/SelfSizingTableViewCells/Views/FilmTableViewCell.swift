//
//  FilmTableViewCell.swift
//  SelfSizingTableViewCells
//
//  Created by Alexander Kurbatov on 04.04.2022.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private var heightConstraintOfTextView: NSLayoutConstraint?

    lazy var filmImageView: UIImageView = {
        let filmImageView = UIImageView()
        filmImageView.translatesAutoresizingMaskIntoConstraints = false
        
        filmImageView.contentMode = .scaleAspectFit
        
        return filmImageView
    }()
    
    lazy var filmTitleLabel: UILabel = {
        let filmTitleLabel = UILabel()
        filmTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        filmTitleLabel.textColor = .systemGray2
        filmTitleLabel.textAlignment = .center
        filmTitleLabel.numberOfLines = 1
        
        return filmTitleLabel
    }()
    
    lazy var moreInfoTextView: UITextView = {
        let moreInfoTextView = UITextView()
        moreInfoTextView.translatesAutoresizingMaskIntoConstraints = false
        
        moreInfoTextView.textColor = UIColor.white
        moreInfoTextView.contentMode = .scaleAspectFill
        moreInfoTextView.backgroundColor = UIColor(named: "AuteursBackground")
        
        moreInfoTextView.textContainerInset = .zero
        moreInfoTextView.textContainer.lineFragmentPadding = 0
        
        moreInfoTextView.isSelectable = false
        moreInfoTextView.isUserInteractionEnabled = false
    
        return moreInfoTextView
    }()
    
    static let moreInfoText = "Tap For Details >"
    
    // MARK: - Inititialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = UIColor(named: "AuteursBackground")
        
        contentView.addSubview(filmImageView)
        contentView.addSubview(filmTitleLabel)
        contentView.addSubview(moreInfoTextView)

        setupCellConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Public methods
    
    func configure(
        title: String,
        plot: String,
        isExpanded: Bool,
        poster: String
    ) {
        filmTitleLabel.text = title
        filmImageView.image = UIImage(named: poster)

        let font = UIFont.systemFont(ofSize: 16)
        let atributes: [NSAttributedString.Key: Any] = [
            .font: font,
        ]
        
        moreInfoTextView.attributedText = NSAttributedString(string: Self.moreInfoText, attributes: atributes)
        moreInfoTextView.text = isExpanded ? plot : Self.moreInfoText
        
        heightConstraintOfTextView?.constant = moreInfoTextView.contentSize.height
        
        moreInfoTextView.textAlignment = isExpanded ? .left : .center
        moreInfoTextView.textColor = isExpanded ? .systemGray3 : .systemRed
    }
    
    // MARK: - Private methods
    
    func setupCellConstraints() {
        NSLayoutConstraint.activate([
            filmImageView.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor, constant: 8),
            filmImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            filmImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            filmTitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filmTitleLabel.widthAnchor.constraint(equalTo: filmImageView.widthAnchor),
            filmTitleLabel.topAnchor.constraint(equalTo: filmImageView.bottomAnchor, constant: 8),
            
            moreInfoTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            moreInfoTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            moreInfoTextView.topAnchor.constraint(equalTo: filmTitleLabel.bottomAnchor, constant: 8),
            moreInfoTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        
        heightConstraintOfTextView = moreInfoTextView.heightAnchor.constraint(equalToConstant: 0)
        heightConstraintOfTextView?.isActive = true
    }
}

