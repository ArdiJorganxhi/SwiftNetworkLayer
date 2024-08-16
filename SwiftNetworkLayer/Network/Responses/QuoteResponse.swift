//
//  QuoteResponse.swift
//  SwiftNetworkLayer
//
//  Created by Ardi Jorganxhi on 13/08/2024.
//

import Foundation


struct QuoteResponse: Decodable, Hashable {
    
    var quote: String = ""
    var author: String = ""
    var category: String = ""
}
