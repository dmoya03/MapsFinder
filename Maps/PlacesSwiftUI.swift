//
//  PlacesSwiftUI.swift
//  Maps
//
//  Created by Daniel Moya on 2/4/24.
//

import SwiftUI
import MapKit

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
struct PlacesSwiftUI: View {
    
    let places = [
        Place(name: "Punta Catalina", latitude: 18.2252751, longitude: -70.2415395),
        Place(name: "Playa Bavaro Punta Cana", latitude: 18.6670056, longitude: -68.4056774),
        Place(name: "Cayo Levantado", latitude: 19.1662422, longitude: -69.2785258)
    ]
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.9792, longitude: 31.1342), latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: places){ place in
            MapMarker(coordinate: place.coordinate, tint: Color.blue)
        }
    }
}
