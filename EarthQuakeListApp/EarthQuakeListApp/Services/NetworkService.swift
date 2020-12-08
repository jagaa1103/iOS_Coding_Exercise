//
//  NetworkService.swift
//  EarthQuakeListApp
//
//  Created by Enkhjargal Gansukh on 2020.12.07.
//  Copyright © 2020 Enkhjargal Gansukh. All rights reserved.
//

import Foundation
import Network

class NetworkService {
    static let shared = NetworkService()
    
    private let queue = DispatchQueue.global()
    private let monitor = NWPathMonitor()
    
    public var isConnected: Bool = false

    
    func startMonitoring() {
        monitor.pathUpdateHandler =  { path in
            self.isConnected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
    
}
