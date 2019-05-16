//
//  PlacesCell.swift
//  FoursquarePOC
//
//  Created by Onur Geneş on 16.05.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit

class PlacesCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(red: 0.29, green: 0.20, blue: 0.78, alpha: 1)
        return lbl
    }()
    
    lazy var addressLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 2
        return lbl
    }()
    
    lazy var countryLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(titleLabel)
        addSubview(addressLabel)
        addSubview(countryLabel)
        
        titleLabel.topToSuperview(offset: 10)
        titleLabel.leading(to: self, offset: 10)
        titleLabel.trailing(to: self, offset: -10)
        titleLabel.height(40)
        
        addressLabel.topToBottom(of: titleLabel, offset: 4)
        addressLabel.bottom(to: self, offset: -10)
        addressLabel.leading(to: self, offset: 10)
        
        countryLabel.topToBottom(of: titleLabel, offset: 10)
        countryLabel.bottom(to: self, offset: -10)
        countryLabel.trailing(to: self, offset: -10)
        countryLabel.width(60)
        
        addressLabel.trailingToLeading(of: countryLabel, offset: -10)
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
