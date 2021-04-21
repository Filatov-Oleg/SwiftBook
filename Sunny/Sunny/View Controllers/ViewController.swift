//
//  ViewController.swift
//  Sunny
//
//  Created by Ivan Akulov on 24/02/2020.
//  Copyright © 2020 Ivan Akulov. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!

    var networkWeatherManager = NetworkWeatherManager()
    lazy var locationManager: CLLocationManager = { // lazy если пользователь не дал доступ к геопозиции (зачем хранить в памяти)
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy = kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization()
        return lm
    }()

    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { [unowned self] city in
            self.networkWeatherManager.fetchCurrentWeather(forRequestType: .cityName(city: city))
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        networkWeatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else {return}
            self.updateInterfaceWith(weather: currentWeather)
        }
        if CLLocationManager.locationServicesEnabled(){
            locationManager.requestLocation()
        }
        
    }
    func updateInterfaceWith(weather: CurrentWeather){
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperatureLabel.text = weather.temperatureString
            self.feelsLikeTemperatureLabel.text = weather.feelsLiketemperatureString
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
    }
}

//MARK: - CLLocationManager
extension ViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let latitude = location.coordinate.latitude // долгота и широта пользователя 👇🏻
        let longitude = location.coordinate.longitude
        
        networkWeatherManager.fetchCurrentWeather(forRequestType: .coordinate(latitude: latitude, longitude: longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

//DELEAGATION
//class ViewController: UIViewController {
//
//    @IBOutlet weak var weatherIconImageView: UIImageView!
//    @IBOutlet weak var cityLabel: UILabel!
//    @IBOutlet weak var temperatureLabel: UILabel!
//    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
//
//    var networkWeatherManager = NetworkWeatherManager()
//
//    @IBAction func searchPressed(_ sender: UIButton) {
//        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
//            self.networkWeatherManager.fetchCurrentWeather(forCity: city)
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        networkWeatherManager.delegate = self
//        networkWeatherManager.fetchCurrentWeather(forCity: "London")
//    }
//}
//
//extension ViewController: NetworkWeatherManagerDelegate{
//    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
//        print(currentWeather.cityName)
//    }
//}

//передача информации через completionHandler
//class ViewController: UIViewController {
//
//    @IBOutlet weak var weatherIconImageView: UIImageView!
//    @IBOutlet weak var cityLabel: UILabel!
//    @IBOutlet weak var temperatureLabel: UILabel!
//    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
//
//    let networkWeatherManager = NetworkWeatherManager()
//
//    @IBAction func searchPressed(_ sender: UIButton) {
//        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
//            self.networkWeatherManager.fetchCurrentWeather(forCity: city) { currentWeather in
//                print(currentWeather.cityName)
//            }
//        }
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        networkWeatherManager.fetchCurrentWeather(forCity: "London") { currentWeather in
//            print(currentWeather.cityName)
//        }
//    }
//}
