//
//  QuoteViewModel.swift
//  SwiftNetworkLayer
//
//  Created by Ardi Jorganxhi on 14/08/2024.
//

import Foundation


final class QuoteViewModel: ObservableObject {
    
    @Published var quotes: [QuoteResponse]?
    private let quoteService: QuoteServiceable
    
    init(quoteService: QuoteServiceable = QuoteService()) {
        self.quoteService = quoteService
    }
    
    func getQuotesByCategory(category: String) {
        Task(priority: .background) {
            let quote = await QuoteService().fetchQuotes(category: category)
            switch quote {
            case .success(let response):
                DispatchQueue.main.async {
                    self.quotes = response
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
