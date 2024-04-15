//
//  MeteorView.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 12.04.2024.
//

import SwiftUI

struct MeteoriteListView: View {
    @EnvironmentObject var meteoriteVm: MeteoriteViewModel
    @EnvironmentObject var routerManager: NavigationRouter
    
    var body: some View {
        NavigationStack(path: $routerManager.routes) {
            ScrollView {
                LazyVStack(spacing: 20) {
                    let filteredMeteors = meteoriteVm.filteredMeteorsData()
                    if filteredMeteors.isEmpty {
                        EmptyStateView()
                    } else {
                        MeteoriteList()
                    }
                }
                .padding()
            }
            .searchable(
                text: $meteoriteVm.searchText,
                placement: .navigationBarDrawer(displayMode: .always),
                prompt: "Search Meteorites"
            )
            .navigationTitle("Meteorite Landings")
            .background(Color.darkBlue.gradient.opacity(0.3))
            .alert(meteoriteVm.errorMessage ?? "Something goes wrong", isPresented: $meteoriteVm.showError) {
                Button("Close", role: .cancel) {
                    meteoriteVm.showError.toggle()
                }
            }
            .navigationDestination(for: Route.self) { $0 }
        }
    }
}

#Preview {
    MeteoriteListView()
        .environmentObject(MeteoriteViewModel())
        .environmentObject(NavigationRouter())
}
