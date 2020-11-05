//
//  RouteStep.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Collection of `RouteIntersection`s that are passed along the segment, the very first one belonging to the `RouteStepManeuver`.
 */
public struct RouteStep: Codable {
    
    /**
     Collection of `RouteIntersection`s that are passed along the segment, the very first one belonging to the `RouteStepManeuver`.
     */
    var intersections: [RouteIntersection]?
    
    /**
     Indicates the side of the road in which the driving takes place.
     */
    var drivingSide: String?
    
    /**
     The calculated weight of the `RouteStep`.
     */
    var weight: Double?
    
    /**
     The unsimplified geometry of the route segment, depending on the geometries parameter. Possible formats: polyline (precision 5), polyline6 (precision 6) or geoJson.
     */
    var geometry: Geometry?
    
    /**
     The estimated travel time for this step, in seconds.
     */
    var duration: Double?
    
    /**
     The distance of travel from the maneuver to the subsequent step, in meters.
     */
    var distance: Double?
    
    /**
     The name of the way along which travel proceeds.
     */
    var name: String?
    
    /**
     The reference number or code for the way. Optionally included, if ref data is available for the given way.
     */
    var ref: String?
    
    /**
     The pronunciation hint of the way name. Will be undefined if there is no pronunciation hint.
     */
    var pronunciation: String?
    
    /**
     The destinations of the way as a String. Will be undefined if there are no destinations.
     */
    var destinations: String?
    
    /**
     A string signifying the mode of transportation.
     */
    var mode: String?
    
    /**
     A `RouteStepManeuver` object representing the maneuver.
     */
    var maneuver: RouteStepManeuver?
    
    /**
     The name for the rotary. Optionally included, if the step is a rotary and a rotary name is available.
     */
    var rotaryName: String?
    
    /**
     The pronunciation hint of the rotary name. Optionally included, if the step is a rotary and a rotary pronunciation is available.
     */
    var rotaryPronunciation: String?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case intersections
        case drivingSide = "driving_side"
        case weight
        case geometry
        case duration
        case distance
        case name
        case ref
        case pronunciation
        case destinations
        case mode
        case maneuver
        case rotaryName = "rotary_name"
        case rotaryPronunciation = "rotary_pronunciation"
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let routeStep = try decoder.container(keyedBy: RouteStep.CodingKeys.self)
        intersections = try routeStep.decodeIfPresent([RouteIntersection].self, forKey: .intersections)
        drivingSide = try routeStep.decodeIfPresent(String.self, forKey: .drivingSide)
        weight = try routeStep.decodeIfPresent(Double.self, forKey: .weight)
        geometry = try routeStep.decodeIfPresent(Geometry.self, forKey: .geometry)
        duration = try routeStep.decodeIfPresent(Double.self, forKey: .duration)
        distance = try routeStep.decodeIfPresent(Double.self, forKey: .distance)
        name = try routeStep.decodeIfPresent(String.self, forKey: .name)
        ref = try routeStep.decodeIfPresent(String.self, forKey: .ref)
        pronunciation = try routeStep.decodeIfPresent(String.self, forKey: .pronunciation)
        destinations = try routeStep.decodeIfPresent(String.self, forKey: .destinations)
        mode = try routeStep.decodeIfPresent(String.self, forKey: .mode)
        maneuver = try routeStep.decodeIfPresent(RouteStepManeuver.self, forKey: .maneuver)
        rotaryName = try routeStep.decodeIfPresent(String.self, forKey: .rotaryName)
        rotaryPronunciation = try routeStep.decodeIfPresent(String.self, forKey: .rotaryPronunciation)
    }
}
