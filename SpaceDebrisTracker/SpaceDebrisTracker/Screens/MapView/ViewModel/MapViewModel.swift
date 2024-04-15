//
//  MapViewModel.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 14.04.2024.
//

import Foundation
import _MapKit_SwiftUI


@MainActor
class MapViewModel: ObservableObject {
    @Published var cameraPosition: MapCameraPosition
    @Published var locationName: String = ""
    let meteor: MeteoriteModel

    init(meteor: MeteoriteModel) {
        self.meteor = meteor
        let initialCoordinate = CLLocationCoordinate2D(latitude: meteor.doubleReclat, longitude: meteor.doubleReclong)
        self.cameraPosition = .region(.init(center: initialCoordinate, latitudinalMeters: 10000, longitudinalMeters: 10000))
    }
    
    func displayPlaceName() async {
        let location = CLLocation(latitude: meteor.doubleReclat, longitude: meteor.doubleReclong)
        
        if let name = await GeoLocagtionService.share.fetchPlaceName(from: location) {
            locationName = name
        } else {
            locationName = "Unable to find the place"
        }
    }
}

