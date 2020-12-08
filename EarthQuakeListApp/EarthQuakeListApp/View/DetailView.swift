//
//  DetailView.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import UIKit
import WebKit

class DetailView: UIViewController {
    
    var webView: WKWebView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        webView = WKWebView(frame: self.view.bounds)
        if let web = webView {
            self.view.addSubview(web)
        }
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: Selector(("dismissView")))
    }
    
    func loadPage(urlString: String) {
        print(urlString)
        let url = URL(string: urlString)!
        webView?.load(URLRequest(url: url))
    }
    
    func dismissView(){
        self.dismiss(animated: true, completion: nil)
    }
}
