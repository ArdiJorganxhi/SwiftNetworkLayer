//
//  ContentView.swift
//  SwiftNetworkLayer
//
//  Created by Ardi Jorganxhi on 13/08/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var quoteViewModel = QuoteViewModel(quoteService: QuoteService())
    var body: some View {
        NavigationStack {
            List(categories, id: \.self) { category in NavigationLink(category, value: category)
                
            }
            .navigationDestination(for: String.self) {
                category in QuoteView(category: category)
                    .environmentObject(quoteViewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
