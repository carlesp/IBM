//
//  TransactionCell.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import UIKit

class TransactionCell: UITableViewCell {

    static let reuseIdentifier = String(describing: TransactionCell.self)
    static let height = CGFloat(60)
    
    let amountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }
    
    private func setUpUI() {
        contentView.addSubview(amountLabel)
        
        amountLabel.anchorCenterYToSuperview()
        amountLabel.anchor(left: contentView.leftAnchor,
                          right: contentView.rightAnchor,
                          leftConstant: 20,
                          rightConstant: 20)
        amountLabel.textColor = .red
        amountLabel.textAlignment = .right
    }
    
    public func configure(with transaction: Transaction) {
        amountLabel.text = "\(transaction.amount) \(transaction.currency)"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        backgroundColor = .clear
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        backgroundColor = .clear
    }
    
}
