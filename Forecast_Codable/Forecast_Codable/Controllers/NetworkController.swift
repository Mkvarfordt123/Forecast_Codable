//
//  NetworkController.swift
//  Forecast_Codable
//
//  Created by Milo Kvarfordt on 6/20/23.
//

import Foundation

@available(iOS 16.0, *)
struct NetworkController {
    static func fetchDays(completion: @escaping (TopLevelDictionary?) -> Void) {
        guard let baseURL = URL(string: "https://api.weatherbit.io") else {completion(nil); return }
        
     var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.path = "/v2.0/forecast/daily"
        let apiQuery = URLQueryItem(name: "key", value: "db82f0a868b04c1cac184985892756af")
        let cityQuery = URLQueryItem(name: "city", value: "Las Vegas")
        let unitsQuery = URLQueryItem(name: "units", value: "I")
        urlComponents?.queryItems = [apiQuery, cityQuery, unitsQuery]
     
        guard let finalURL = urlComponents?.url else {completion(nil); return }
        URLSession.shared.dataTask(with: finalURL) { dayData, _, error in
            if let error {
                print("Skkiirrrttt, Hold up there chump, fix the error at hand before you continue on!", error.localizedDescription)
                completion(nil); return
            }
            guard let data = dayData else {completion(nil); return }
            
            do {
                let topLevelDictionary = try JSONDecoder().decode(TopLevelDictionary.self, from: data)
                completion(topLevelDictionary)
            } catch {
                print("There was an error decoding the data", error.localizedDescription)
            }
        }.resume()
    }
}
