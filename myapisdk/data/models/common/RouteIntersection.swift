//
//  RouteIntersection.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 An intersection gives a full representation of any cross-way the path passes by. For every `RouteStepManeuver`, the very first intersection (intersections[0]) corresponds to the location of the `RouteStepManeuver`. Further intersections are listed for every cross-way until the next turn instruction.
 */
public struct RouteIntersection: Codable {
    
    /**
     Location of the crossway.
     */
    var location: Coordinate?
    
    /**
     A list of bearing values (e.g. [0,90,180,270]) that are available at the intersections. These bearings describe all available roads at the intersection.
     */
    var bearings: [Double]?
    
    /**
     A list of entry flags, corresponding in a 1:1 relationship to the bearings. A value of `true` indicates that the respective road could be entered on a valid route. `false` indicates that the turn onto the respective road would violate a restriction.
    */
    var entries: [Bool]?
    
    /**
     Index into bearings/entry array. Used to calculate the bearing just before the turn. Namely, the clockwise angle from true north to the direction of travel immediately before the `RouteStepManeuver` / passing the `RouteIntersection`. Bearings are given relative to the `RouteIntersection`. To get the bearing in the direction of driving, the bearing has to be rotated by a value of 180. The value is not supplied for depart `RouteStepManeuver`s.
     */
    var inAt: Double?
    
    /**
     Index into the bearings/entry array. Used to extract the bearing just after the turn. Namely, the clockwise angle from true north to the direction of travel immediately after the `RouteStepManeuver` / passing the `RouteIntersection`. The value is not supplied for arrive maneuvers.
     */
    var outAt: Double?
    
    /**
     Array of Lane objects that denote the available turn lanes at the intersection. If no lane information is available for an intersection, the lanes property will not be present.
     */
    var lanes: [Lane]?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case location
        case bearings
        case entries = "entry"
        case inAt = "in"
        case outAt = "out"
        case lanes
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let routeIntersection = try decoder.container(keyedBy: RouteIntersection.CodingKeys.self)
        location = try routeIntersection.decodeIfPresent(Coordinate.self, forKey: .location)
        bearings = try routeIntersection.decodeIfPresent([Double].self, forKey: .bearings)
        entries = try routeIntersection.decodeIfPresent([Bool].self, forKey: .entries)
        inAt = try routeIntersection.decodeIfPresent(Double.self, forKey: .inAt)
        outAt = try routeIntersection.decodeIfPresent(Double.self, forKey: .outAt)
        lanes = try routeIntersection.decodeIfPresent([Lane].self, forKey: .lanes)
    }
}
