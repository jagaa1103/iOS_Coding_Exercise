//
//  TableCell.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit

class TableCell: UITableViewCell {
    var title: UILabel!
    var subtitle: UILabel!
    var numberLabel: UILabel!
    var numDesc: UILabel!
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        title = UILabel(frame: .init(x: 0, y: 0, width: self.bounds.width * 0.9, height: self.bounds.height / 2))
        subtitle = UILabel(frame: .init(x: 0, y: self.bounds.height / 2, width: self.bounds.width * 0.9, height: self.bounds.height / 2))
        subtitle.font = .systemFont(ofSize: 12)
        numberLabel = UILabel(frame: .init(x: self.bounds.width * 0.9, y: 0, width: self.bounds.width * 0.1, height: self.bounds.height))
        numberLabel.font = .systemFont(ofSize: 20)
        numDesc = UILabel(frame: .zero)
        numDesc.font = .systemFont(ofSize: 12)
        
        
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numDesc.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.contentView.addSubview(title)
        self.contentView.addSubview(subtitle)
        self.contentView.addSubview(numberLabel)
        self.contentView.addSubview(numDesc)
        
        
        let viewsDict: [String: UILabel] = [
             "title": title,
             "subtitle": subtitle,
             "numberLabel": numberLabel,
             "numDesc": numDesc
         ]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[title(30)]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[subtitle]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:[subtitle]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:|-[title]-[subtitle]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|-[title]-[numberLabel(50)]-|", options: [], metrics: nil, views: viewsDict))
//        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:|-[numberLabel]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:|-[numberLabel]-[numDesc]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|-[subtitle]-[numDesc(50)]-|", options: [], metrics: nil, views: viewsDict))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
