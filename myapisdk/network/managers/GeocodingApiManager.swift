//
//  GeocodingApiManager.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 29/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Convenience structure for `GeocodingApi` to easily access the suite of APIs.
 */
public struct GeocodingApiManager {
    
    /**
    Direct geocoding API. Translates an address as input into geographic coordinates.
    - Parameter address: The address we want to translate into geographic coordinates.
    - Parameter sourceLat: Source coordinate latitude.
    - Parameter sourceLon: Source coordinate longitude.
    - Parameter onSuccess: A closure which is called with `DirectGeocodingResponse` object.
    - Parameter onError: A closure which is called with a `String` representation of the error.
    
    - Returns: A `DirectGeocodingResponse` object
    */
    public func direct<DirectGeocodingResponse: Codable>(
        address: String,
        sourceLat: Double? = nil,
        sourceLon:  Double? = nil,
        onSuccess: @escaping DeserializedModelCompletion<DirectGeocodingResponse>,
        onError: @escaping ErrorCompletion
    ) {
        let router: Router<GeocodingApi> = Router<GeocodingApi>()
        router.request(
            route: .direct(address, sourceLat, sourceLon),
            responseType: DirectGeocodingResponse.self,
            onSuccess: {response in onSuccess(response)},
            onError: {error in onError(error)}
        )
    }
    
    /**
    Reverse geocoding API. Translates an address as input into geographic coordinates. If there are multiple possible results, it retrieves the list of possible results ordered by the distance to the provided source coordinate (if any), in ascending order.
    - Parameter lat: The latitude component of the coordinate.
    - Parameter lon: The longitude component of the coordinate.
    - Parameter onSuccess: A closure which is called with `ReverseGeocodingResponse` object.
    - Parameter onError: A closure which is called with a `String` representation of the error.
    
    - Returns: A `ReverseGeocodingResponse` object
    */
    public func reverse<ReverseGeocodingResponse: Codable>(
        lat: Double,
        lon:  Double,
        onSuccess: @escaping DeserializedModelCompletion<ReverseGeocodingResponse>,
        onError: @escaping ErrorCompletion
    ) {
        let router: Router<GeocodingApi> = Router<GeocodingApi>()
        router.request(
            route: .reverse(lat, lon),
            responseType: ReverseGeocodingResponse.self,
            onSuccess: {response in onSuccess(response)},
            onError: {error in onError(error)}
        )
    }
    
}
