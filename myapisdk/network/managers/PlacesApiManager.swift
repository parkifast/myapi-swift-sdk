//
//  PlacesApiManager.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 29/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Convenience structure for `PlacesApi` to easily access the suite of APIs.
 */
public struct PlacesApiManager {
    
    /**
    Places API - Search: Searches around a set of `Coordinate`s within a certain radius (in meters) to retrieve a list of nearby points of interest of a specific type (optionally).
    - Parameter lat: Latitude.
    - Parameter lon: Longitude.
    - Parameter radius: Radius of search in meters.
    - Parameter type: The specific type of point of interest (optional).
    - Parameter next: A next page results token (optional).
    - Parameter limit: The max number of results that should be retrieved (default 25, max 250) (optional).
    - Parameter onSuccess: A closure which is called with `SearchPlacesResponse` object.
    - Parameter onError: A closure which is called with a `String` representation of the error.
    
    - Returns: A `SearchPlacesResponse` object
    */
    public func search<SearchPlacesResponse: Codable>(
        lat: Double,
        lon: Double,
        radius: Int,
        type: String? = nil,
        next: String? = nil,
        limit: Int? = 25,
        onSuccess: @escaping DeserializedModelCompletion<SearchPlacesResponse>,
        onError: @escaping ErrorCompletion
    ) {
        let router: Router<PlacesApi> = Router<PlacesApi>()
        router.request(
            route: .search(lat, lon, radius, type, next, limit),
            responseType: SearchPlacesResponse.self,
            onSuccess: {response in onSuccess(response)},
            onError: {error in onError(error)}
        )
    }
    
}
