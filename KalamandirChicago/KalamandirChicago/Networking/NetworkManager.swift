//
//  NetworkManager.swift
//  KalamandirChicago
//
//  Created by Varshitha VRaj on 01/09/25.
//

import Foundation
import Combine

public protocol EndPoint {
    
    var baseURL: URL {get}
    var path: String {get}
    var method: HTTPMethod {get}
    var headers: [String: String] {get}
//    var query: [URLQueryItem] {get}
    var body: Data? {get}
    
}


public enum HTTPMethod: String{
    case GET, POST, PUT, DELETE
}

public enum NetworkError: Error{
    
    case invalidURL
    case emptyData
    case clientError(status: Int, data: Data)
    case serverError(status: Int, data: Data)
    case unacceptableStatus(status: Int, data: Data)
    
}

public struct DefaultRequestBuilder{
    
    public init(){}
    
    public func makeRequest(from endPoint: EndPoint) throws -> URLRequest {
        var components = URLComponents(url: endPoint.baseURL.appendingPathComponent(endPoint.path), resolvingAgainstBaseURL: false)
//        components?.queryItems = endPoint.query.isEmpty ? nil : endPoint.query
        guard let url = components?.url else { throw NetworkError.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = endPoint.method.rawValue
        endPoint.headers.forEach { request.setValue($0.value, forHTTPHeaderField: $0.key) }
        request.httpBody = endPoint.body
        return request
        
    }

}



