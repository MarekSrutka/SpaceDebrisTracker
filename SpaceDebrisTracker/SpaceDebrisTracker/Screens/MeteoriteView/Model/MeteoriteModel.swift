//
//  MeteoriteModel.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 11.04.2024.
//

import Foundation

struct MeteoriteModel: Codable, Identifiable {
    let name: String
    let id: String
    let nametype: String
    let recclass: String
    let mass: String?
    let fall: String
    let year: String?
    var reclat: String?
    var reclong: String?
    
    enum CodingKeys: String, CodingKey {
        case name, id, nametype, recclass, mass, fall, year, reclat, reclong
    }
    
    var readableYear: String {
        // Vytvoření DateFormatter pro parsování ISO 8601 datumu
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate, .withDashSeparatorInDate]
        if let date = formatter.date(from: year ?? "N/A") {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year], from: date)
            if let year = components.year {
                return "\(year)"
            }
        }
        return "Unknown Year"
    }
    
    var doubleReclat: Double {
        Double(reclat ?? "0") ?? 0
    }
    
    var doubleReclong: Double {
        Double(reclong ?? "0") ?? 0
    }
}

extension MeteoriteModel: Equatable {
    static func == (lhs: MeteoriteModel, rhs: MeteoriteModel) -> Bool {
        return lhs.id == rhs.id
    }
}

extension MeteoriteModel {
    static let Mock = [
        MeteoriteModel(name: "Alfons", id: "1", nametype: "Valid", recclass: "L5", mass: "21", fall: "Fell", year: "1880-01-01T00:00:00.000", reclat: "50.775000", reclong: "6.083330"),
        MeteoriteModel(name: "Adzhi-Bogdo (Stone)", id: "2", nametype: "Valid", recclass: "H6", mass: "720", fall: "Fell", year: "1951-01-01T00:00:00.000", reclat: "56.183330", reclong: "10.233330"),
        MeteoriteModel(name: "Cecil", id: "3", nametype: "Valid", recclass: "EH4", mass: "107000", fall: "Found", year: "1952-01-01T00:00:00.000", reclat: "54.216670", reclong: "-113.000000")
    ]
}
