//
//  WeatherView.swift
//  HiWeather
//
//  Created by Ahmad Ayman on 9/8/17.
//  Copyright © 2017 Ahmad Ayman. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherStatusImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    
    override func awakeFromNib() {
    }
    
    func configure(_ weather: Weather) {
        cityLabel.text = weather.city
        weatherStatusImage.image = UIImage(named: "\(weather.type)")
        tempLabel.text = "\(weather.temp)°"
        weatherStatusLabel.text = "\(weather.day), \(weather.type)"
        if weather.isNightTime() {
            self.backgroundColor = UIColor(red:0.20, green:0.29, blue:0.37, alpha:1.0)
            if weather.type == "Clear" || weather.type == "Clouds" {
                weatherStatusImage.image = UIImage(named: "\(weather.type) Night")
            }
        }
    }
    
    
    
}
