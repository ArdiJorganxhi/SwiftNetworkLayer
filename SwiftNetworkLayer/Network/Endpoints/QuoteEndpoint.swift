//
//  QuoteEndpoint.swift
//  SwiftNetworkLayer
//
//  Created by Ardi Jorganxhi on 13/08/2024.
//

import Foundation

enum QuoteEndpoint {
    case quote(category: String)
}

extension QuoteEndpoint: Endpoint {
    var path: String {
        return "/v1/quotes"
    }
    
    var method: HTTPMethod {
        return .GET
    }
    
    var params: [URLQueryItem] {
        switch self {
        case .quote(let category):
            return [
            URLQueryItem(name: "category", value: category)
            ]
        }
    }
    
    var body: Data? {
        return nil
    }
}
