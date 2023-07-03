//
//  ViewController.swift
//  Care
//
//  Created by Alexander Suprun on 05.06.2023.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    private var galleryCollectionView = GalleryCollectionView()
 
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var tempurateLabel: UILabel!
    
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        startLocationManager()
       
        view.addSubview(galleryCollectionView)
        galleryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galleryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galleryCollectionView.topAnchor.constraint(equalTo: weatherIconImageView.bottomAnchor, constant: 100).isActive = true
        galleryCollectionView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        
        
        galleryCollectionView.reloadData()
  
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    func startLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy =  kCLLocationAccuracyBest
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.startUpdatingLocation()
        }
    }
    
    func uptadeView() {
        cityNameLabel.text = weatherData.name
        weatherDescriptionLabel.text = DataSource.weatherIDs[weatherData.weather[0].id]
        tempurateLabel.text = weatherData.main.temp.description + "°"
        weatherIconImageView.image = UIImage(named: weatherData.weather[0].icon)
        

        let asd = Double(weatherData.main.temp.description)
        let ass = Int(asd ?? 0)
        
            if 0..<10 ~= ass {
            galleryCollectionView.set(cells: Model.Snimki010())
            } else if 10..<50 ~= ass {
            galleryCollectionView.set(cells: Model.Snimki1020())
        }
        galleryCollectionView.reloadData()
    }
    
    
    func setBackground() {
         let date = Date()
         let calendar = Calendar.current
         let hour = calendar.component(.hour, from: date)
         if 6..<18 ~= hour {
             background.image = UIImage(named: "back_morning")
         } else if 18...24 ~= hour {
             background.image = UIImage(named: "back_night")
         } else if 0..<6 ~= hour {
             background.image = UIImage(named: "back_morning")
         }
    }
    func uptadeWeatherInfo(latitude: Double, longtitude: Double) {
        let session = URLSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longtitude)&units=metric&appid=eb95d4a8d31110b1d091182c02e558ec")!
        
        let task = session.dataTask(with: url) { ( data, response, error) in
            guard error == nil, let data = data, let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data) else {
                print("DataTask error : \(error?.localizedDescription ?? "unknown error")")
                return
            }
            self.weatherData = weatherData
            DispatchQueue.main.async {
                self.uptadeView()
               
            }
        }
        task.resume()
        
    }
}
    
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations : [CLLocation]) {
        if let lastLocation = locations.last{
            uptadeWeatherInfo(latitude: lastLocation.coordinate.latitude, longtitude: lastLocation.coordinate.longitude)
               
        }
    }
}
