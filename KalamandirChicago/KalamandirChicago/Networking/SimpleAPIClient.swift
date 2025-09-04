//
//  SimpleAPIClient.swift
//  KalamandirChicago
//
//  Created by Varshitha VRaj on 01/09/25.
//

import Foundation

final class SimpleAPIClient{
    
    private let session: URLSession = .shared
    private let builder = DefaultRequestBuilder()
    
    
    
    func send<T: Decodable>(endPoint: EndPoint) async throws -> T{
        
        let request = try builder.makeRequest(from: endPoint)
        
        let (data, response) = try await session.data(for: request)
        
        print("API Call Successfull: \(data)")
        
        if let rawString = String(data: data, encoding: .utf8) {
               print("Raw Response:\n\(rawString)")
           } else {
               print("⚠️ Could not convert data to UTF-8 string")
           }
        
        try validate(response: response, data: data)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    
    private func validate(response: URLResponse, data: Data) throws {
        
        guard let http = response as? HTTPURLResponse else { return }
        switch http.statusCode {
        case 200...299: return
        case 400...499: throw NetworkError.clientError(status: http.statusCode, data: data)
        case 500...599: throw NetworkError.serverError(status: http.statusCode, data: data)
        default: throw NetworkError.unacceptableStatus(status: http.statusCode, data: data)
            
        }
    }
    
}


