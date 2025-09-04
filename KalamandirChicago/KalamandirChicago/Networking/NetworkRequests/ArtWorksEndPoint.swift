//
//  ArtWorksEndPoint.swift
//  KalamandirChicago
//
//  Created by Varshitha VRaj on 01/09/25.
//

import Foundation

struct ArtWorksEndPoint: EndPoint{

    var baseURL: URL = URL(string: "https://api.artic.edu")!

    var path: String = "api/v1/artworks"
    var method: HTTPMethod = .GET
    var headers: [String : String] = ["Accept": "application/json"]
//    var query: [URLQueryItem]
    var body: Data? = nil
    
}
