//
//  SearchViewController.swift
//  Maps
//
//  Created by Daniel Moya on 2/4/24.
//

import UIKit
import MapKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        search.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search.resignFirstResponder()
        guard let finder = search.text else { return }
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(finder) { (places:[CLPlacemark]?, error) in
            if error == nil {
                let place = places?.first
                let annotation = MKPointAnnotation()
                annotation.coordinate = (place?.location?.coordinate)!
                annotation.title = finder
                
                let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
                self.map.setRegion(region, animated: true)
                self.map.addAnnotation(annotation)
                self.map.selectAnnotation(annotation, animated: true)
                
            } else {
                //Alert
                print("Location not found")
                ToastView.shared.showToast(message: "The place was not found")

            }
        }
    }

}
