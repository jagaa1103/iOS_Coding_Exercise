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
//        let url = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&latitude=33.097582&longitude=-96.820382&maxradiuskm=300"
        let url = "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson"
        let dates = Dates()
        return String(format: "%@&%@", url, dates.getFormattedDate())
    }
    
    static func formattedTime(dateNum: Int) -> String {
        let timeInterval = TimeInterval(dateNum / 1000)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
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

