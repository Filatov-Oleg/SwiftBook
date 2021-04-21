//
//  NetworkWeatherManager.swift
//  Sunny
//
//  Created by Ivan Akulov on 28/02/2020.
//  Copyright © 2020 Ivan Akulov. All rights reserved.
//

import Foundation
import CoreLocation



class NetworkWeatherManager {
    
    enum RequestType{
        case cityName(city: String)
        case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    }
    
    var onCompletion: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forRequestType requestType: RequestType){
        var urlString = ""
        switch requestType {
        case .cityName(let city):
            urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)&units=metric"
        case .coordinate(let latitude, let longitude):
            urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&apikey=\(apiKey)&units=metric"
    }
        performRequest(withURLString: urlString)
}
    
//    func fetchCurrentWeather(forCity city: String) {
//        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)&units=metric"
//        performRequest(withURLString: urlString)
//    }
//
//    func fetchCurrentWeather(forLatitude latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
//        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&apikey=\(apiKey)&units=metric"
//        performRequest(withURLString: urlString)
//    }
    
    fileprivate func performRequest(withURLString urlString: String){
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onCompletion?(currentWeather)
                }
            }
        }
        task.resume()
    }
    
    fileprivate func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { return nil }
            return currentWeather
            // print(currentWeatherData.main.temp)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}


//Delegation
//protocol NetworkWeatherManagerDelegate: class {
//    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather)
//}
//
//
//class NetworkWeatherManager {
//
//    weak var delegate: NetworkWeatherManagerDelegate?
//
//    func fetchCurrentWeather(forCity city: String) {
//        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)"
//        guard let url = URL(string: urlString) else { return }
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            if let data = data {
//                if let currentWeather = self.parseJSON(withData: data) {
//                    self.delegate?.updateInterface(self, with: currentWeather)
//                }
//            }
//        }
//        task.resume()
//    }
//
//    func parseJSON(withData data: Data) -> CurrentWeather? {
//        let decoder = JSONDecoder()
//        do {
//          let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
//            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { return nil }
//            return currentWeather
//           // print(currentWeatherData.main.temp)
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//        return nil
//    }
//}

//передача информации через completionHandler
//struct NetworkWeatherManager {
//    func fetchCurrentWeather(forCity city: String, completionHandler: @escaping (CurrentWeather) -> Void) {
//        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)"
//        guard let url = URL(string: urlString) else { return }
//        let session = URLSession(configuration: .default)
//        let task = session.dataTask(with: url) { data, response, error in
//            if let data = data {
//                if let currentWeather = self.parseJSON(withData: data) {
//                    completionHandler(currentWeather)
//                }
//            }
//        }
//        task.resume()
//    }
//
//    func parseJSON(withData data: Data) -> CurrentWeather? {
//        let decoder = JSONDecoder()
//        do {
//          let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
//            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else { return nil }
//            return currentWeather
//           // print(currentWeatherData.main.temp)
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//        return nil
//    }
//}
