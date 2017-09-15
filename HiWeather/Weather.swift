//
//  Weather.swift
//  HiWeather
//
//  Created by Ahmad Ayman on 9/6/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import Foundation
import ObjectMapper

class Weather: Mappable {
    private var _city: String!
    private var _type: String!
    private var _temp: Double!
    private var _weatherId: Int!
    private var _sunrise: Int!
    private var _sunset: Int!
    private var _pressure: Double!
    private var _windSpeed: Double!
    private var _windDeg: Int!
    private var _humidity: Int!
    
    private var _isNightTime: Bool!
    private var _imageName: String!
    private var _day: String!

    var city: String {
        get {
            if _city == nil {
                return ""
            }
            print(_city)
            return _city
        }
        set {
            _city = newValue
        }
    }
    
    var type: String {
        get {
            if _type == nil {
                return ""
            }
            return _type
        }
        set {
            _type = newValue
        }
    }
    
    var temp: Double {
        get {
            if _temp == nil {
                return 0
            }
            return convertToCelsius(_temp)
        }
        set {
            _temp = newValue
        }
    }
    
    private var weatherId: Int {
        get {
            if _weatherId == nil {
                return 0
            }
            return _weatherId
        }
        set {
            _weatherId = newValue
        }
    }
    
    private var sunrise: Int {
        get {
            if _sunrise == nil {
                return 0
            }
            return _sunrise
        }
        set {
            print(newValue)
            _sunrise = newValue
        }
    }
    
    private var sunset: Int {
        get {
            if _sunset == nil {
                return 0
            }
            return _sunset
        }
        set {
            _sunset = newValue
        }
    }
    
    var pressure: Double {
        get {
            if _pressure == nil {
                return 0.0
            }
            return _pressure
        }
        set {
            _pressure = newValue
        }
    }

    var windSpeed: Double {
        get {
            if _windSpeed == nil {
                return 0.0
            }
            return _windSpeed
        }
        set {
            _windSpeed = newValue
        }
    }
    
    var windDeg: Int {
        get {
            if _windDeg == nil {
                return 0
            }
            return _windDeg
        }
        set {
            _windDeg = newValue
        }
    }
    
    var humidity: Int {
        get {
            if _humidity == nil {
                return 0
            }
            return _humidity
        }
        set {
            _humidity = newValue
        }
    }
    
    var day: String {
        get {
            if _day == nil {
                return ""
            }
            return _day
        }
        set {
            _day = newValue
        }
    }

    var imageName: String {
        get {
            if _type == nil {
                return "Clear"
            }
            
            var name = weatherImageName(_weatherId)
            
            return name
        }
    }
    
    
    init() {
        day = getCurrentDay()
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        city <- map["name"]
        type <- map["weather.0.main"]
        temp <- map["main.temp"]
        weatherId <- map["weather.0.id"]
        sunrise <- map["sys.sunrise"]
        sunset <- map["sys.sunset"]
        pressure <- map["main.pressure"]
        windSpeed <- map["wind.speed"]
        windDeg <- map["wind.deg"]
        humidity <- map["main.humidity"]
    }
    
    func isNightTime() -> Bool {
        let gmt = TimeInterval(7200)
        let currentDate = Date() + gmt
        let sunsetTime = convertTimeFromUnix(sunset) + gmt
        if currentDate > sunsetTime {
            return true
        }
        return false
    }
}
