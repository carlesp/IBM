//
//  ProductCell.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import UIKit

class ProductCell: UITableViewCell {

    static let reuseIdentifier = String(describing: ProductCell.self)
    static let height = CGFloat(60)
    
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpUI()
    }
    
    private func setUpUI() {
        contentView.addSubview(label)
        label.anchorCenterYToSuperview()
        label.anchor(left: contentView.leftAnchor,
                     right: contentView.rightAnchor,
                     leftConstant: 20,
                     rightConstant: 20)
    }
    
    public func configure(with product: Product) {
        label.text = product.sky
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        backgroundColor = .clear
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        backgroundColor = .clear
    }
    
}
