//
//  TableView.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit

class TableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    var pageDelegate: TablePageProtocol?
    var features = [Feature]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.register(TableCell.self, forCellReuseIdentifier: "cell")
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func updateTable(features: [Feature]?) {
         guard let feats = features else {
             return
         }
         self.features = feats
         self.reloadData()
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.features.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
        let prop = features[indexPath.row].properties
        cell.title.text = prop.place
        cell.subtitle.text = "\(Constants.formattedTime(dateNum: prop.time)) \(prop.status)"
        if let mag = prop.mag {
            cell.numberLabel.text = "\(mag)"
        }else {
            cell.numberLabel.text = "--"
        }
        cell.numDesc.text = prop.magType ?? "--"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pageDelegate?.selected(prop: features[indexPath.row].properties)
    }
    
}


protocol TablePageProtocol {
    func selected(prop: Property)
}
