//
//  Day.swift
//  Forecast_Codable
//
//  Created by Milo Kvarfordt on 6/20/23.
//

import Foundation

struct TopLevelDictionary: Decodable {
    private enum  CodingKeys: String, CodingKey {
        case days = "data"
        case cityName = "city_name"
    }
    let cityName: String
    let days: [Day]
}
struct Day: Decodable {
    private enum CodingKeys: String, CodingKey {
        case temp
        case highTemp = "high_temp"
        case lowTemp = "low_temp"
        case validDate = "valid_date"
        case weather
    }
    let temp: Double
    let highTemp: Double
    let lowTemp: Double
    let validDate: String
    let weather: Weather
}
struct Weather: Decodable {
    private enum CodingKeys: String, CodingKey {
        case description
        case iconString = "icon"
    }
    let description: String
    let iconString: String
}
