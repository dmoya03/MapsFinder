//
//  HomeSwiftUI.swift
//  Maps
//
//  Created by Daniel Moya on 1/4/24.
//

import SwiftUI
import MapKit
import Combine

struct HomeSwiftUI: View {
    
    @StateObject var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    @State var cancelable: AnyCancellable?
    
    func showLocation(){
        cancelable = locationManager.$locations.sink { (location) in
            region = MKCoordinateRegion(center: location?.coordinate ?? CLLocationCoordinate2D(), latitudinalMeters: 2000, longitudinalMeters: 2000)
            
        }
    }
    
    var body: some View {
        VStack{
            Map(coordinateRegion: $region, interactionModes: .all, showsUserLocation: true, userTrackingMode: nil)
        }
        .navigationBarTitle("Maps SwiftUi")
        .navigationBarItems(trailing:
        NavigationLink(
            destination: PlacesSwiftUI(),
            label: {
            Text("Places")
            })
        )
        .onAppear{
            showLocation()
        }
    }
}
