//
//  Endpoint.swift
//  SwiftNetworkLayer
//
//  Created by Ardi Jorganxhi on 13/08/2024.
//

import Foundation



protocol Endpoint {
    var scheme: String { get }
    var host: String { get }
    var port: Int { get }
    var path: String { get }
    var params: [URLQueryItem] { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: Data? { get }
    
}

extension Endpoint {
    var scheme: String {
        return "https"
    }
    var host: String {
        return "api.api-ninjas.com"
    }
    var port: Int {
        return 80
    }
    
    var header: [String: String]? {
        guard let apiKey = ProcessInfo.processInfo.environment["API_NINJAS_X_API_KEY"] else {
            return nil
        }
        return [
            "Content-Type": "application/json",
            "X-Api-Key": apiKey
        ]
    }
}
