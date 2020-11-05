//
//  DirectionsApiManager.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 29/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Convenience structure for `DirectionsApi` to easily access the suite of APIs.
 */
public struct DirectionsApiManager {
    
    /**
    Directions API - Route Calculation Service: Calculates a route between an origin and a destination, possibly passing through many waypoints. It takes into consideration several configuration options in order to customize the response.
    - Parameter profile: The profile used to calculate the route, such as car, on_foot or bicycle.
    - Parameter orig: Origin of the route.
    - Parameter dest: Destination of the route.
    - Parameter waypoints: Intermediate stops along the route.
    - Parameter alternatives: Request alternative routes, if possible.
    - Parameter steps: Indicate steps along the route.
    - Parameter geometry: Format in which to output the route representation.
    - Parameter overview: How detailed the route representation should be.
    - Parameter onSuccess: A closure which is called with `RouteDirectionsResponse` object.
    - Parameter onError: A closure which is called with a `String` representation of the error.
    
    - Returns: A `RouteDirectionsResponse` object
    */
    public func calcRoute<RouteDirectionsResponse: Codable>(
        profile: Profile,
        orig: Any,
        dest: Any,
        waypoints: Any? = nil,
        alternatives: Bool? = false,
        steps: Bool? = true,
        geometries: GeometryType? = .polyline,
        overview: Overview? = .simplified,
        onSuccess: @escaping DeserializedModelCompletion<RouteDirectionsResponse>,
        onError: @escaping ErrorCompletion
    ) {
        let router: Router<DirectionsApi> = Router<DirectionsApi>()
        router.request(
            route: .route(profile, orig, dest, waypoints, alternatives!, steps!, geometries!, overview!),
            responseType: RouteDirectionsResponse.self,
            onSuccess: {response in onSuccess(response)},
            onError: {error in onError(error)}
        )
    }
    
    /**
    Directions API - Time Matrix Service: This service takes as input a list of coordinates and computes in a matrix format the fastest travel time among all possible pair combinations among all the provided coordinates. If sources/destinations params are provided, those indicate a semi-colon separated list of indices that specify which of the provided coordinates should be included as sources or destinations.
    - Parameter profile: The profile used to calculate the route, such as car, on_foot or bicycle.
    - Parameter coordinateList: Semi-colon separated values indicating all the coordinates to use.
    - Parameter sourceIndices: Semi-colon separated values indicating the indices of those coordinates from the list that should be used as sources. By default, if not provided, all coordinates will be used as sources.
    - Parameter destinationIndices: Semi-colon separated values indicating the indices of those coordinates from the list that should be used as destinations. By default, if not provided, all coordinates will be used as destinations.
    - Parameter annotations: Return the requested table or tables in response. Possible values are duration, distance or all (default).
    - Parameter onSuccess: A closure which is called with `MatrixDirectionsResponse` object.
    - Parameter onError: A closure which is called with a `String` representation of the error.
    
    - Returns: A `MatrixDirectionsResponse` object
    */
    public func calcMatrix<MatrixDirectionsResponse: Codable>(
        profile: Profile,
        coordinateList: Any,
        sourceIndices:  Any? = nil,
        destinationIndices: Any? = nil,
        annotations: Annotations? = .all,
        onSuccess: @escaping DeserializedModelCompletion<MatrixDirectionsResponse>,
        onError: @escaping ErrorCompletion
    ) {
        let router: Router<DirectionsApi> = Router<DirectionsApi>()
        router.request(
            route: .matrix(profile, coordinateList, sourceIndices, destinationIndices, annotations),
            responseType: MatrixDirectionsResponse.self,
            onSuccess: {response in onSuccess(response)},
            onError: {error in onError(error)}
        )
    }
    
    /**
    Directions API - Traveling Salesman Problem Resolution Service: It solves the Traveling Salesman Problem using a greedy heuristic (farthest-insertion algorithm) for 10 or more waypoints and uses brute force for less than 10 waypoints. The returned path does not have to be the fastest path. As TSP is NP-hard it only returns an approximation. Note that all input coordinates have to be connected for this service to work.
    - Parameter profile: The profile used to calculate the route, such as car, on_foot or bicycle.
    - Parameter coordinateList: Semi-colon separated values indicating all the coordinates to use.
    - Parameter roundtrip: Return route is a roundtrip (route returns to first location). Possible values are: true (default) or false.
    - Parameter source: Return route starts at "any" or "first" coordinate. Possible values are: "any" (default) or "first".
    - Parameter destination: Return route ends at "any" or "last" coordinate.
    - Parameter steps: Indicate steps along the route.
    - Parameter geometry: Format in which to output the route representation.
    - Parameter overview: How detailed the route representation should be.
    - Parameter onSuccess: A closure which is called with `TravelingSalesmanDirectionsResponse` object.
    - Parameter onError: A closure which is called with a `String` representation of the error.
    
    - Returns: A `TravelingSalesmanDirectionsResponse` object
    */
    public func travelingSalesman<TravelingSalesmanDirectionsResponse: Codable>(
        profile: Profile,
        coordinateList: Any,
        roundtrip: Bool? = true,
        source: Source? = .any,
        destination: Destination? = .any,
        steps: Bool? = true,
        geometries: GeometryType? = .polyline,
        overview: Overview? = .simplified,
        onSuccess: @escaping DeserializedModelCompletion<TravelingSalesmanDirectionsResponse>,
        onError: @escaping ErrorCompletion
    ) {
        let router: Router<DirectionsApi> = Router<DirectionsApi>()
        router.request(
            route: .travelingSalesman(profile, coordinateList, roundtrip!, source!, destination!, steps!, geometries!, overview!),
            responseType: TravelingSalesmanDirectionsResponse.self,
            onSuccess: {response in onSuccess(response)},
            onError: {error in onError(error)}
        )
    }
    
}
