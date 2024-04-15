//
//  NavigationRoute.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 14.04.2024.
//

import Foundation

final class NavigationRouter: ObservableObject {
    @Published var routes = [Route]()
    
    func push(to screen: Route) {
        guard !routes.contains(screen) else {
            return
        }
        
        routes.append(screen)
    }
    
    func goBack() {
        _ = routes.popLast()
    }
    
    func reset() {
        routes = []
    }
    
    func replace(stack: [Route]) {
        routes = stack
    }
}
