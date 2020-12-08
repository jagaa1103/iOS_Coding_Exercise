//
//  Feature.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import Foundation

struct Feature: Codable {
    let id: String
    let type: String
    let properties: Property
    let geometry: Geometry
}




