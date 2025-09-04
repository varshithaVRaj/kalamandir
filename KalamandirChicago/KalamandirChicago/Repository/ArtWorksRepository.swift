//
//  ArtWorksRepository.swift
//  KalamandirChicago
//
//  Created by Varshitha VRaj on 01/09/25.
//

import Foundation

struct ArtworksRepository {
    
    private let client = SimpleAPIClient()
    // If you want to read from API config.iiif_url, you can fetch once and cache it.
    // For now, hardcode known base:
    private let baseImageURL = "https://www.artic.edu/iiif/2"

    /// Returns domain models ready for UI
    func fetchArtworks(page: Int = 1, limit: Int = 20) async throws -> [Artwork] {
        
        let endpoint = ArtWorksEndPoint()
        
        let dto: ArtworksResponseDTO = try await client.send(endPoint: endpoint)
        return dto.data.map { $0.toDomain(baseImageURL: baseImageURL) }
        
    }
}

