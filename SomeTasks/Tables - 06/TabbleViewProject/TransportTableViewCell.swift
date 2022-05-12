import UIKit

final class TransportTableViewCell: ConfigurableCell<TransportModel> {
    
    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor.tableColor(.backgroundColor)
        contentView.backgroundColor = UIColor.tableColor(.backgroundColor)
        textLabel?.backgroundColor = UIColor.tableColor(.backgroundColor)
        detailTextLabel?.backgroundColor = UIColor.tableColor(.backgroundColor)
        imageView?.backgroundColor = UIColor.tableColor(.backgroundColor)
        
        let selectedView = UIView()
        selectedView.backgroundColor = .systemYellow
        selectedBackgroundView = selectedView
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
    
    override func configure(_ model: TransportModel) {
        super.configure(model)
        
        textLabel?.text = model.transportName
        detailTextLabel?.text = model.transportDescription
        imageView?.image = model.transportIcon
    }
    
}
