//
//  HTTPRequest.swift
//  SwiftNetworkLayer
//
//  Created by Ardi Jorganxhi on 13/08/2024.
//

import Foundation
import Combine

protocol HTTPRequest {
    func sendRequest<T: Decodable>(endpoint: Endpoint, response: T.Type) async -> Result<T, NetworkError>
}

extension HTTPRequest {
    func sendRequest<T: Decodable>(endpoint: Endpoint, response: T.Type) async -> Result<T, NetworkError> {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.queryItems = endpoint.params
        
        guard let url = urlComponents.url else {
            print(urlComponents)
            return .failure(.invalidURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = body
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                return .failure(.noData)
            }
            
            switch response.statusCode {
            case 200...299:
                guard let decodeResponse = try? JSONDecoder().decode(T.self, from: data) else {
                    return .failure(.decodingError)
                }
                return .success(decodeResponse)
            case 401:
                return .failure(.custom(message: "Unauthorized"))
            default:
                return .failure(.custom(message: "Unexpected error"))
            }
        } catch {
            return .failure(.custom(message: "Unknown error"))
        }
              
    }
}
