//
//  SpaceDebrisTrackerApp.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 11.04.2024.
//

import SwiftUI

@main
struct SpaceDebrisTrackerApp: App {
    @StateObject var meteoriteVm = MeteoriteViewModel()
    @StateObject var routerManager = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            MeteoriteListView()
                .environmentObject(meteoriteVm)
                .environmentObject(routerManager)
                .task {
                    meteoriteVm.loadData()
                }
                .preferredColorScheme(.dark)
        }
    }
}
