//
//  LocationManager.swift
//  Maps
//
//  Created by Daniel Moya on 1/4/24.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    @Published var locations: CLLocation? = nil
    
    override init() {
        super.init()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.locations = location
    }
}
