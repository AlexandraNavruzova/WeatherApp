//
//  ViewController.swift
//  WeatherApp
//
//  Created by Александра Наврузова on 22.06.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

  let locationManager = CLLocationManager()
  var location: CLLocation?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    checkLocationServices()
  }

}

extension ViewController: CLLocationManagerDelegate {
  
  func setupLocationManager() {
    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
  }
  
  func checkLocationServices() {
    if CLLocationManager.locationServicesEnabled() {
      setupLocationManager()
    } else {
      
    }
  }
  
  func getUserCoordinates() {
    if let coordinates = locationManager.location?.coordinate {
      print("Latitude: \(coordinates.latitude), Longitude: \(coordinates.longitude)")
    }
    DispatchQueue.main.async {
      
    }
  }
  
  func checkLocationAuthorization() {
    switch locationManager.authorizationStatus {
    case .authorizedWhenInUse:
      getUserCoordinates()
      locationManager.startUpdatingLocation()
      break
    case .denied:
      break
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
      break
    case .restricted:
      break
    default:
      break
    }
  }
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    checkLocationAuthorization()
  }
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    checkLocationAuthorization()
  }
}
