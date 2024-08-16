//
//  QuoteService.swift
//  SwiftNetworkLayer
//
//  Created by Ardi Jorganxhi on 14/08/2024.
//

import Foundation


struct QuoteService: HTTPRequest, QuoteServiceable {
    func fetchQuotes(category: String) async -> Result<[QuoteResponse], NetworkError> {
        return await sendRequest(endpoint: QuoteEndpoint.quote(category: category), response: [QuoteResponse].self)
    }
    
    
}
