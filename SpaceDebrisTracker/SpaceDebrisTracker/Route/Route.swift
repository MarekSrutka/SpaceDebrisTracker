//
//  Route.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 14.04.2024.
//

import Foundation
import SwiftUI

enum Route {
    case map(meteor: MeteoriteModel)
}

extension Route: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.map(let lhsItem), .map(let rhsItem)):
            return lhsItem.id == rhsItem.id
        }
    }
}


extension Route: View {
    
    var body: some View {
        switch self {
        case .map(meteor: let item):
            MapView(mapVm: MapViewModel(meteor: item))
        }
    }
}
