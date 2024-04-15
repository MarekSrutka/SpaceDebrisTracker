//
//  GeoLocagtionService.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 15.04.2024.
//

import Foundation

import CoreLocation

class GeoLocagtionService {
    static let share = GeoLocagtionService()
    
    func fetchPlaceName(from location: CLLocation) async -> String? {
        let geocoder = CLGeocoder()
        
        do {
            let placemarks = try await geocoder.reverseGeocodeLocation(location)
            
            if let placemark = placemarks.first {
                if let locality = placemark.locality, let administrativeArea = placemark.administrativeArea, let country = placemark.country {
                    return "\(locality + ", ") \(administrativeArea + ", ") \(country)"
                } else {
                    return "Unknown Place"
                }
            } else {
                return "Unknown Place"
            }
        } catch {
            print("Geocoding error: \(error.localizedDescription)")
            return nil
        }
    }
}

