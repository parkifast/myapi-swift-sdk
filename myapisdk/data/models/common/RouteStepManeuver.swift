//
//  RouteStepManeuver.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Contains all necessary information on what to do to progress from current `RouteStep` to the next.
 */
public struct RouteStepManeuver: Codable {
    
    /**
     The exact location in which the `RouteStepManeuver` needs to take place.
     */
    var location: Coordinate?
    
    /**
     The clockwise angle from true north to the direction of travel immediately before the maneuver.
     */
    var bearingBefore: Double?
    
    /**
     The clockwise angle from true north to the direction of travel immediately after the maneuver.
     */
    var bearingAfter: Double?
    
    /**
     A string indicating the type of maneuver. New identifiers might be introduced without API change Types unknown to the client should be handled like the turn type, the existence of correct modifier values is guaranteed.
     
     **turn** - A basic turn into direction of the `modifier`.
     
     **new name** - No turn is taken/possible, but the road name changes. The road can take a turn itself, following `modifier`.
     
     **depart** - Indicates the departure of the leg.
     
     **arrive** - Indicates the destination of the leg.
     
     **merge** - Merge onto a street (e.g. getting on the highway from a ramp, the `modifier` specifies the direction of the merge).
     
     **ramp** - Deprecated. Replaced by `on ramp` and `off ramp`.
     
     **on ramp** - Take a ramp to enter a highway (direction given my `modifier`).
     
     **off ramp** - Take a ramp to exit a highway (direction given my `modifier`).
     
     **fork** - Take the left/right side at a fork depending on `modifier`.
     
     **end of road** - Road ends in a T intersection turn in direction of `modifier`.
     
     **use lane** - Going straight on a specific lane.
     
     **continue** - Turn in direction of `modifier` to stay on the same road.
     
     **roundabout** - Traverse roundabout, has additional field exit with NR if the roundabout is left. the `modifier` specifies the direction of entering the roundabout.
     
     **rotary** - A traffic circle. While very similar to a larger version of a roundabout, it does not necessarily follow roundabout rules for right of way. It can offer `rotary_name`/`rotary_pronunciation` in addition to the `exit` parameter.
     
     **roundabout turn** - Describes a turn at a small roundabout that should be treated as normal turn. The `modifier` indicates the turn direction. Example instruction: At the roundabout turn left.
     
     **notification** - Not an actual turn but a change in the driving conditions. For example the travel mode. If the road takes a turn itself, the `modifier` describes the direction.
     */
    var type: String?
    
    /**
     An optional `String` indicating the direction change of the maneuver.
     
     **uturn** - Indicates reversal of direction.
     
     **sharp right** - A sharp right turn.
     
     **right** - A normal turn to the right.
     
     **slight right** - A slight turn to the right.
     
     **straight** - No relevant change in direction.
     
     **slight left** - A slight turn to the left.
     
     **left** - A normal turn to the left.
     
     **sharp left** - A sharp turn to the left.
     */
    var modifier: String?
    
    /**
     Optional field. It indicates the nnumber of the exit to take. The field exists for the following type fields:
     
     **roundabout/rotary** - Number of the exit to take. If exit is `undefined` the destination is on the roundaboout.
     
     **else** - Indicates the number of intersections passed until the turn. Example instruction: at the fourth intersection, turn left.
     */
    var exit: Int?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case location
        case bearingBefore = "bearing_before"
        case bearingAfter = "bearing_after"
        case type
        case modifier
        case exit
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let routeStepManeuver = try decoder.container(keyedBy: RouteStepManeuver.CodingKeys.self)
        location = try routeStepManeuver.decodeIfPresent(Coordinate.self, forKey: .location)
        bearingBefore = try routeStepManeuver.decodeIfPresent(Double.self, forKey: .bearingBefore)
        bearingAfter = try routeStepManeuver.decodeIfPresent(Double.self, forKey: .bearingAfter)
        type = try routeStepManeuver.decodeIfPresent(String.self, forKey: .type)
        modifier = try routeStepManeuver.decodeIfPresent(String.self, forKey: .modifier)
        exit = try routeStepManeuver.decodeIfPresent(Int.self, forKey: .exit)
    }
}
