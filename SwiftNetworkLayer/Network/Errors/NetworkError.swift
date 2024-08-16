//
//  NetworkError.swift
//  SwiftNetworkLayer
//
//  Created by Ardi Jorganxhi on 13/08/2024.
//

import Foundation


enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
    case custom(message: String)
}
