//
//  MeteorFallsViewModel.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 12.04.2024.
//

import Foundation
import Combine
import UIKit

class MeteoriteViewModel: ObservableObject {
    @Published var meteoriteData: [MeteoriteModel] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var showError = false
    @Published var searchText = ""
    
    private var networkService = NetworkService()
    private var cancellables: Set<AnyCancellable> = []
    private var currentPage = 0
    private var canLoadMoreData = true
    
    func loadData() {
        guard !isLoading && canLoadMoreData else { return }
        
        isLoading = true
        
        networkService.fetchMeteorFalls(page: currentPage, limit: 100)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                case .failure(let error):
                    self?.showError.toggle()
                    self?.errorMessage = "Error loading data: \(error.localizedDescription)"
                }
            }, receiveValue: { [weak self] data in
                if !data.isEmpty {
                    self?.meteoriteData.append(contentsOf: data)
                    self?.currentPage += 1
                }
                self?.canLoadMoreData = !data.isEmpty
            })
            .store(in: &self.cancellables)
    }
    
    func loadNextData(meteor: MeteoriteModel) {
        guard meteor == meteoriteData.last else { return }
        
        loadData()
    }
    
    func filteredMeteorsData() -> [MeteoriteModel] {
        meteoriteData.filter { meteor in
            searchText.isEmpty || meteor.name.localizedCaseInsensitiveContains(searchText)
        }
    }
}
