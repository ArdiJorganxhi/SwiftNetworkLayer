//
//  QuoteServiceable.swift
//  SwiftNetworkLayer
//
//  Created by Ardi Jorganxhi on 14/08/2024.
//

import Foundation


protocol QuoteServiceable {
    func fetchQuotes(category: String) async -> Result<[QuoteResponse], NetworkError>
}
