//
//  QuoteView.swift
//  SwiftNetworkLayer
//
//  Created by Ardi Jorganxhi on 14/08/2024.
//

import SwiftUI

struct QuoteView: View {
    let category: String
    @EnvironmentObject var quoteViewModel: QuoteViewModel
    var body: some View {
        VStack(alignment: .leading) {
            if let quotes = quoteViewModel.quotes {
                Text(quotes[0].quote)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Text("-" + " " + quotes[0].author)
                    .padding()
            } else {
                Text("Loading..")
                    .onAppear {
                        quoteViewModel.getQuotesByCategory(category: category)
                    }
            }
        }
        .onDisappear {
            quoteViewModel.quotes = nil
        }
    }
}

#Preview {
    QuoteView(category: "Hello")
        .environmentObject(QuoteViewModel())
}
