//
//  Constants.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

struct Constants {
    
    static func getFormattedURL() -> String {
        let url = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson"
        let dates = Dates()
        return String(format: "%@&%@", url, dates.getFormattedDate())
    }
}

struct Dates {
    var now: Date
    var prev: Date
    
    init() {
        self.now = Date()
        self.prev = Calendar.current.date(byAdding: .month, value: -1, to: self.now)!
    }
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let current = dateFormatter.string(from: now)
        let previous = dateFormatter.string(from: prev)
        return "&starttime=\(previous)&endtime=\(current)"
    }
    
}

