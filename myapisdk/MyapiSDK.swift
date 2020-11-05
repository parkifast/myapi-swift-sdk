//
//  MyapiSDK.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 17/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 SDK provided by [mymappi](https://mymappi.com) to easily access a wide variety of mobility APIs.
 */
public class MyapiSDK: NSObject {
    
    /**
     `GeocodingApiManager` instance to easily access the whole Geocoding API suite.
     */
    public var geocodingApi = GeocodingApiManager()
    
    /**
    `RoadsApiManager` instance to easily access the whole Roads API suite.
    */
    public var roadsApi = RoadsApiManager()
    
    /**
    `DirectionsApiManager` instance to easily access the whole Directions API suite.
    */
    public var directionsApi = DirectionsApiManager()
    
    /**
    `PlacesApiManager` instance to easily access the whole Places API suite.
    */
    public var placesApi = PlacesApiManager()
    
}
