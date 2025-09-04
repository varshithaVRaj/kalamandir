//
//  DashboardViewModel.swift
//  KalamandirChicago
//
//  Created by Varshitha VRaj on 01/09/25.
//


import Foundation

@MainActor
final class DashboardViewModel {
    private let repo = ArtworksRepository()

    // UI state
    private(set) var items: [Artwork] = []{
        didSet{
            for i in items{
                print("Art name: \(i.artist)")
            }
        }
    }
    private(set) var isLoading = false
    private(set) var errorMessage: String?

    // Notify VC when state changes
    var onChange: (() -> Void)?

    // Simple pagination support (optional)
    private var page = 1
    private let limit = 20
    private var canLoadMore = true

    func refresh() {
        page = 1
        canLoadMore = true
        items.removeAll()
        loadMore()
    }

    func loadMore() {
        guard !isLoading, canLoadMore else { return }
        isLoading = true; errorMessage = nil; onChange?()

        Task {
            do {
                let newItems = try await repo.fetchArtworks(page: page, limit: limit)
                if newItems.isEmpty { canLoadMore = false }
                if page == 1 { items = newItems } else { items += newItems }
                page += 1
            } catch {
                errorMessage = error.localizedDescription
            }
            isLoading = false
            onChange?()
        }
    }
}
