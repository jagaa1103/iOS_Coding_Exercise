//
//  MainView.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

class MainView : UINavigationController, TablePageProtocol {
    
    var tableView = TableView()
    
    var activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        showActivityIndicator()
        fetchData()
    }
    
    func showActivityIndicator() {
        activityIndicator.style = .gray
        activityIndicator.center = self.view.center
        self.view.addSubview(activityIndicator)
        self.activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator(){
        self.activityIndicator.stopAnimating()
        self.activityIndicator.removeFromSuperview()
    }
    
    func fetchData() {
        DataService().fetchEarthQuakeData() { data in
            if let d = data {
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                    self.showTable()
                    self.tableView.updateTable(features: d)
                }
            } else {
                let alert = UIAlertController(title: "Alert", message: "App cannot get data from server. Please try again!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    func showTable() {
        tableView = TableView(frame: self.view.bounds)
        tableView.pageDelegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        
        tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive = true
        tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: -30).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
    }
    
    
    
    func selected(prop: Property) {
        let detailView = SFSafariViewController(url: URL(string: prop.url)!)
        present(detailView, animated: true, completion: nil)
    }
}
