//
//  Constants.swift
//  RainyShinyCloud
//
//  Created by Ahmad Ayman on 8/27/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let FORECAST_BASE_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let FORECAST_PARAMETER_COUNT = "7"
let API_KEY = "f0023d3db1681a6adaa3597a65c8eba9"
let API_KEY_PARAMETER_NAME = "appid"
let LAT_PARAMETER_NAME = "lat"
let LON_PARAMETER_NAME = "lon"
let COUNT_API_PARAMETER_NAME = "cnt"

typealias DownloadCompleted = () -> ()

