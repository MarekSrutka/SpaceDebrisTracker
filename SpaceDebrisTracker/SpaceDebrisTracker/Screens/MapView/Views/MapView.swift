//
//  LocationMeteorFall.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 13.04.2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var mapVm: MapViewModel
    
    var body: some View {
        VStack(spacing: .zero) {
            Map(position: $mapVm.cameraPosition) {
                Marker(mapVm.meteor.name, coordinate: .init(latitude: mapVm.meteor.doubleReclat, longitude: mapVm.meteor.doubleReclong))
            }
            
            MapModalView(locationName: $mapVm.locationName, meteor: mapVm.meteor)
        }
        .ignoresSafeArea()
        .navigationTitle(mapVm.meteor.name)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await mapVm.displayPlaceName()
        }
    }
}


#Preview {
    MapView(mapVm: MapViewModel(meteor: MeteoriteModel.Mock[1]))
}
