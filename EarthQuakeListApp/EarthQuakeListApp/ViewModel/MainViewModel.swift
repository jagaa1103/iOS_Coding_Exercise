//
//  MainViewModel.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

class MainViewModel {
    
    func fetchEarthQuakeData() {
        let urlString = Constants.getFormattedURL()
        guard let url = URL(string: urlString) else { return }
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            print(data)
        }
        session.resume()
    }
}
