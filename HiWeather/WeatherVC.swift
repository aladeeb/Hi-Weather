//
//  ViewController.swift
//  HiWeather
//
//  Created by Ahmad Ayman on 9/6/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper
import CoreLocation

class WeatherVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var weatherView: WeatherView!
    
    let locationManager = CLLocationManager()
    
    var weather = Weather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        locationManager.delegate = nil
        if location.horizontalAccuracy > 0 {
            
            locationManager.stopUpdatingLocation()
                        
            let latitude = String(location.coordinate.latitude)
            let longitude = String(location.coordinate.longitude)

            let params : [String : String] = [LAT_PARAMETER_NAME : latitude, LON_PARAMETER_NAME : longitude, API_KEY_PARAMETER_NAME : API_KEY]

            makeRequest(parameters: params) {
                self.updateView()
            }
        }
    }
    
    func makeRequest(parameters: [String : String], completion: @escaping DownloadCompleted) {
        Alamofire.request(BASE_URL, method: .get, parameters: parameters).responseJSON {
            response in
            let res = response.result
            
            switch res {
            case .success(let result) :
                let json = JSON(result)
                print(parameters)
                print(json)
                self.weather.mapping(map: Map(mappingType: .fromJSON, JSON: json.dictionaryObject!))
                break
            case .failure(let err) :
                print(err as NSError)
                break
            }
            completion()
        }
    }
    
    func updateView() {
        weatherView.configure(self.weather)
    }
    

}

