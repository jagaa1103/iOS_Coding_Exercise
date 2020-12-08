//
//  Property.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import Foundation


struct Property: Codable {
    let mag: Double?
    let place: String
    let time: Int
//    let updated: Int64
//    let tz: Int
    let url: String
//    let detail: String
//    let alert: String?
//    let felt: Int?
    let status: String
//    let tsunami: Int
//    let sig: Int
//    let net: String
//    let code: String
//    let rms: Double
    let magType: String?
//    let type: String
    let title: String
}
