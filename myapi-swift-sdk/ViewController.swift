//
//  ViewController.swift
//  myapi iOS SDK
//
//  Created by Alberto Rodriguez Sanchez on 15/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import UIKit
import myapisdk

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myapi = MyapiSDK()
        myapi.geocodingApi.direct(
            address: "Calle del Doctor Esquerdo 187",
            onSuccess: {response in self.handleDirectGeocodingSuccess(response)},
            onError: {error in self.handleError("Direct Geocoding: " + error!)}
        )
        myapi.geocodingApi.direct(
            address: "Calle del Doctor Esquerdo 187",
            sourceLat: 40.4,
            sourceLon: -3.3,
            onSuccess: {response in self.handleDirectGeocodingSuccess(response)},
            onError: {error in self.handleError("Reverse Geocoding: " + error!)}
        )
        myapi.geocodingApi.reverse(
            lat: 40.416657,
            lon: -3.703794,
            onSuccess: {response in self.handleReverseGeocodingSuccess(response)},
            onError: {error in self.handleError("Reverse Geocoding: " + error!)}
        )
        myapi.roadsApi.snap(
            lat: 40.416657,
            lon: -3.703794,
            onSuccess: {response in self.handleSnapRoadsSuccess(response)},
            onError: {error in self.handleError("Snap Roads: " + error!)}
        )
        myapi.roadsApi.highwayType(
            lat: 40.416657,
            lon: -3.703794,
            onSuccess: {response in self.handleHighwayTypeRoadsSuccess(response)},
            onError: {error in self.handleError("Highway Type Roads: " + error!)}
        )
        myapi.roadsApi.speedLimit(
            lat: 40.416657,
            lon: -3.703794,
            onSuccess: {response in self.handleSpeedLimitRoadsSuccess(response)},
            onError: {error in self.handleError("Speed Limit Roads: " + error!)}
        )
        myapi.roadsApi.distance(
            lat: 40.416657,
            lon: -3.703794,
            onSuccess: {response in self.handleDistanceRoadsSuccess(response)},
            onError: {error in self.handleError("Distance Roads: " + error!)}
        )
        myapi.roadsApi.nearest(
            lat: 40.416657,
            lon: -3.703794,
            onSuccess: {response in self.handleNearestRoadsSuccess(response)},
            onError: {error in self.handleError("Nearest Roads: " + error!)}
        )
        myapi.directionsApi.calcRoute(
            profile: .car,
            orig: Coordinate(lat: 40.416657, lon: -3.703794),
            dest: "40.414851,-3.669497",
            waypoints: "40.422773,-3.696606;40.421367,-3.679847",
            alternatives: false,
            steps: true,
            overview: .simplified,
            onSuccess: {response in self.handleRouteDirectionsSuccess(response)},
            onError: {error in self.handleError("Route Directions: " + error!)}
        )
        myapi.directionsApi.calcMatrix(
            profile: .car,
            coordinateList: "40.427772,-3.714630;40.407348,-3.710520;40.461178,-3.676533;40.441933,-3.650275;40.434914,-3.697337;40.451737,-3.683682",
            sourceIndices: "0;1;2",
            destinationIndices: "3;4;5",
            onSuccess: {response in self.handleMatrixDirectionsSuccess(response)},
            onError: {error in self.handleError("Matrix Directions: " + error!)}
        )
        myapi.directionsApi.travelingSalesman(
            profile: .car,
            coordinateList: "40.427772,-3.714630;40.407348,-3.710520;40.461178,-3.676533;40.441933,-3.650275;40.434914,-3.697337;40.451737,-3.683682",
            roundtrip: true,
            source: .any,
            destination: .any,
            steps: true,
            overview: .simplified,
            onSuccess: {response in self.handleTravelingSalesmanDirectionsSuccess(response)},
            onError: {error in self.handleError("Traveling Salesman Directions: " + error!)}
        )
        myapi.placesApi.search(
            lat: 40.427772,
            lon: -3.714630,
            radius: 300,
            type: "bar",
            onSuccess: {response in self.handleSearchPlacesSuccess(response)},
            onError: {error in self.handleError("Search Places: " + error!)}
        )
    }
    
    func handleDirectGeocodingSuccess(_ response: DirectGeocodingResponse?) {
        print("Success!")
        //print(response)
    }
    
    func handleReverseGeocodingSuccess(_ response: ReverseGeocodingResponse?) {
        print("Success!")
        //print(response)
    }
    
    func handleSnapRoadsSuccess(_ response: SnapRoadsResponse?) {
        print("Success!")
        //print(response)
    }
    
    func handleHighwayTypeRoadsSuccess(_ response: HighwayTypeRoadsResponse?) {
        print("Success!")
        //print(response)
    }
    
    func handleSpeedLimitRoadsSuccess(_ response: SpeedLimitRoadsResponse?) {
        print("Success!")
        //print(response)
    }
    
    func handleDistanceRoadsSuccess(_ response: DistanceRoadsResponse?) {
        print("Success!")
        //print(response)
    }
    
    func handleNearestRoadsSuccess(_ response: NearestRoadsResponse?) {
        print("Success!")
        //print(response)
    }
    
    func handleRouteDirectionsSuccess(_ response: RouteDirectionsResponse?) {
        print("Success!")
        //print(response)
    }
    
    func handleMatrixDirectionsSuccess(_ response: MatrixDirectionsResponse?) {
        print("Success!")
        //print(response)
    }
    
    func handleTravelingSalesmanDirectionsSuccess(_ response: TravelingSalesmanDirectionsResponse?) {
        print("Success!")
        //print(response)
    }
    
    func handleSearchPlacesSuccess(_ response: SearchPlacesResponse?) {
        print("Success!")
        //print(response)
    }
    
    func handleError(_ error: String?) {
        print("Error!")
        print(error)
    }


}

