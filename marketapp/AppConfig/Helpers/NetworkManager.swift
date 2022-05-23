//
//  NetworkManager.swift
//  marketapp
//
//  Created by Andres Lopez on 22/05/22.
//

import Foundation
import Network

class NetworkManager: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnected = false
    
    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
    }
    
    func startMonitor() {
        monitor.start(queue: queue)
    }
    
    func cancelMonitor() {
        monitor.cancel()
    }
}
