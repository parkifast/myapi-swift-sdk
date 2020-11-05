//
//  RoadsApiManager.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 29/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Convenience structure for `RoadsApi` to easily access the suite of APIs.
 */
public struct RoadsApiManager {
    
    /**
    Roads API: Snap to road. Given a geographical coordinate, it retrieves the another coordinate which is snapped to the nearest road. This means that the snapped coordinate is found by calculating the intersection between the longitudinal axis of the nearest road segment and the perpendicular line between the provided coordinate and this longitudinal axis.
    - Parameter lat: The latitude component of the coordinate.
    - Parameter lon: The longitude component of the coordinate.
    - Parameter onSuccess: A closure which is called with `SnapRoadsResponse` object.
    - Parameter onError: A closure which is called with a `String` representation of the error.
    
    - Returns: A `SnapRoadsResponse` object
    */
    public func snap<SnapRoadsResponse: Codable>(
        lat: Double,
        lon:  Double,
        onSuccess: @escaping DeserializedModelCompletion<SnapRoadsResponse>,
        onError: @escaping ErrorCompletion
    ) {
        let router: Router<RoadsApi> = Router<RoadsApi>()
        router.request(
            route: .snap(lat, lon),
            responseType: SnapRoadsResponse.self,
            onSuccess: {response in onSuccess(response)},
            onError: {error in onError(error)}
        )
    }
    
    /**
    Roads API: Retrieve highway type.  Given a coordinate, finds the nearest road and determines what type of road it is (motorway, path, primary... etc.)
    - Parameter lat: The latitude component of the coordinate.
    - Parameter lon: The longitude component of the coordinate.
    - Parameter onSuccess: A closure which is called with `HighwayTypeRoadsResponse` object.
    - Parameter onError: A closure which is called with a `String` representation of the error.
    
    - Returns: A `HighwayTypeRoadsResponse` object
    */
    public func highwayType<HighwayTypeRoadsResponse: Codable>(
        lat: Double,
        lon:  Double,
        onSuccess: @escaping DeserializedModelCompletion<HighwayTypeRoadsResponse>,
        onError: @escaping ErrorCompletion
    ) {
        let router: Router<RoadsApi> = Router<RoadsApi>()
        router.request(
            route: .highwayType(lat, lon),
            responseType: HighwayTypeRoadsResponse.self,
            onSuccess: {response in onSuccess(response)},
            onError: {error in onError(error)}
        )
    }
    
    /**
    Roads API: Retrieve speed limit for road.  Given a coordinate, it retrieves speed limit info about the nearest road segment in kilometers per hour.
    - Parameter lat: The latitude component of the coordinate.
    - Parameter lon: The longitude component of the coordinate.
    - Parameter onSuccess: A closure which is called with `SpeedLimitRoadsResponse` object.
    - Parameter onError: A closure which is called with a `String` representation of the error.
    
    - Returns: A `SpeedLimitRoadsResponse` object
    */
    public func speedLimit<SpeedLimitRoadsResponse: Codable>(
        lat: Double,
        lon:  Double,
        onSuccess: @escaping DeserializedModelCompletion<SpeedLimitRoadsResponse>,
        onError: @escaping ErrorCompletion
    ) {
        let router: Router<RoadsApi> = Router<RoadsApi>()
        router.request(
            route: .speedLimit(lat, lon),
            responseType: SpeedLimitRoadsResponse.self,
            onSuccess: {response in onSuccess(response)},
            onError: {error in onError(error)}
        )
    }
    
    /**
    Roads API: Retrieve distance to nearest road.  Given a coordinate, it calculates the distance between it and the snapped coordinate to the nearest road in kilometers.
    - Parameter lat: The latitude component of the coordinate.
    - Parameter lon: The longitude component of the coordinate.
    - Parameter onSuccess: A closure which is called with `DistanceRoadsResponse` object.
    - Parameter onError: A closure which is called with a `String` representation of the error.
    
    - Returns: A `DistanceRoadsResponse` object
    */
    public func distance<DistanceRoadsResponse: Codable>(
        lat: Double,
        lon:  Double,
        onSuccess: @escaping DeserializedModelCompletion<DistanceRoadsResponse>,
        onError: @escaping ErrorCompletion
    ) {
        let router: Router<RoadsApi> = Router<RoadsApi>()
        router.request(
            route: .distance(lat, lon),
            responseType: DistanceRoadsResponse.self,
            onSuccess: {response in onSuccess(response)},
            onError: {error in onError(error)}
        )
    }
    
    /**
    Roads API: Retrieve nearest road information.  Given a coordinate, it determines the nearest road and retrieves all possible information about it.
    - Parameter lat: The latitude component of the coordinate.
    - Parameter lon: The longitude component of the coordinate.
    - Parameter onSuccess: A closure which is called with `NearestRoadsResponse` object.
    - Parameter onError: A closure which is called with a `String` representation of the error.
    
    - Returns: A `NearestRoadsResponse` object
    */
    public func nearest<NearestRoadsResponse: Codable>(
        lat: Double,
        lon:  Double,
        onSuccess: @escaping DeserializedModelCompletion<NearestRoadsResponse>,
        onError: @escaping ErrorCompletion
    ) {
        let router: Router<RoadsApi> = Router<RoadsApi>()
        router.request(
            route: .nearest(lat, lon),
            responseType: NearestRoadsResponse.self,
            onSuccess: {response in onSuccess(response)},
            onError: {error in onError(error)}
        )
    }
    
}
