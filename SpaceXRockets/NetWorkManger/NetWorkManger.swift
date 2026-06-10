//
//  NetWorkManger.swift
//  SpaceXRockets
//
//  Created by Naga Rajitha Bhogadi on 6/9/26.
//

protocol NetworkProtocol {
    func getDataFromServer(for url: String) -> [Rocket]
}

/// singleton
final class NetworkManager: Sendable, NetworkProtocol {
    static let sharedInstance = NetworkManager()
    private init() {}
    
    func getDataFromServer(for url: String) -> [Rocket] {
        // TODO: - Fetching data from server goes here , once done remove this comment.
        /// logic to fetch the data from the server
        /// convert the fetched data into data model of type Product
        return []
    }
}
