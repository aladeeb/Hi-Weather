//
//  Functions.swift
//  RainyShinyCloud
//
//  Created by Ahmad Ayman on 9/6/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import Foundation

func convertToCelsius(_ kelvin: Double) -> Double {
    let kelvinToCelsiusPreDivision = (kelvin - 273.15)
    let kelvinToCelsius = Double(round(10 * kelvinToCelsiusPreDivision/10))
    return kelvinToCelsius
}

func weatherImageName(_ id: Int) -> String {
    var name = ""
    switch id {
	case 200...232:
        name = "Thunderstorm"
        
	case 300...531:
        name = "Rain"
        
	case 600...622:
        name = "Snow"

	case 701...800:
        name = "Clear"

    case 801...804:
        name = "Clouds"

	case 900:
        name = "Clouds"

	case 901...902:
        name = "Clouds"

	case 903:
        name = "Scattered Clouds"

	case 904:
        name = "Scattered Clouds"

	case 905:
        name = "Scattered Clouds"

	case 906:
        name = "Scattered Clouds"

	default:
        name = "Clear"
    }

    return name
}

func getCurrentDay() -> String {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    return dateFormatter.string(from: date)
}

func convertTimeFromUnix(_ givenDate: Int) -> Date {
    let date = Date(timeIntervalSince1970: TimeInterval(givenDate))
    return date
}

