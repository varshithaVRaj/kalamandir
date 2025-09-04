//
//  ArtWorkModel.swift
//  KalamandirChicago
//
//  Created by Varshitha VRaj on 01/09/25.
//
import Foundation

struct Artwork{
    
    let id: Int
    let title: String
    let artist: String
    let imageURL: URL?
    
}

struct ArtworksResponseDTO: Decodable{
    
    let data: [ArtworkDTO]
    let pagination: PaginationDTO
}

struct ArtworkDTO: Decodable{
    
    let id: Int
    let title: String
    let artist_display: String?
    let image_id: String?
    

    
}

struct PaginationDTO: Decodable{
    
    let total: Int
    let limit: Int
    let offset: Int
    let total_pages: Int
    let current_page: Int

}

extension ArtworkDTO{
    
    //MARK: CONVERT DTO TO DMO
    
    func toDomain(baseImageURL: String? = nil) -> Artwork{
        
        var url: URL? = nil
        if let base = baseImageURL, let id = image_id {
            url = URL(string: "\(base)/\(id)/full/843,/0/default.jpg")
        }
        
        return Artwork(id: id, title: title, artist: artist_display ?? "Unknown", imageURL: url)
        
    }
    
    
    
}
