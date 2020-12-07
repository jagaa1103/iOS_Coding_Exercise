//
//  MainView.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit

class MainView : UIViewController {
    
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        let label = UILabel()
        label.text = "MainView"
        self.view.addSubview(label)
        
        viewModel.fetchEarthQuakeData()
    }
}
