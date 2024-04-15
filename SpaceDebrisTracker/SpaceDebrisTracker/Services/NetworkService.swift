//
//  NetworkService.swift
//  SpaceDebrisTracker
//
//  Created by Marek Srutka on 12.04.2024.
//

import Foundation
import Combine

class NetworkService {
    let appToken = "vnwLR5AibTp3qkuubuso4kOOo"
    
    func fetchMeteorFalls(page: Int, limit: Int) -> AnyPublisher<[MeteoriteModel], Error> {
        let offset = page * limit
        let urlString = "https://data.nasa.gov/resource/y77d-th95.json"
        var components = URLComponents(string: urlString)!
        components.queryItems = [
            URLQueryItem(name: "$limit", value: "\(limit)"),
            URLQueryItem(name: "$offset", value: "\(offset)"),
        ]
        
        guard let url = components.url else {
            fatalError("Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(appToken, forHTTPHeaderField: "X-App-Token")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [MeteoriteModel].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
