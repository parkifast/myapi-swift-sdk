//
//  Lane.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 A `Lane` represents a turn lane at the corresponding turn location.
 */
public struct Lane: Codable {
    
    /**
     An indication (e.g. marking on the road) specifying the turn lane. A road can have multiple indications (e.g. an arrow pointing straight and left). The indications are given in a list, each containing one of the following types. Further indications might be added on without an API version change.
     
     **none** - No dedicated indication is shown.
     
     **uturn** - An indication signaling the possibility to reverse (i.e. fully bend arrow).
     
     **sharp right** - An indication indicating a sharp right turn (i.e. strongly bend arrow).
     
     **right** - An indication indicating a right turn (i.e. bend arrow).
     
     **slight right** - An indication indicating a slight right turn (i.e. slightly bend arrow).
     
     **straight** - No dedicated indication is shown (i.e. straight arrow).
     
     **slight left** - An indication indicating a slight left turn (i.e. slightly bend arrow).
     
     **left** - An indication indicating a left turn (i.e. bend arrow).
     
     **sharp left** - An indication indicating a sharp left turn (i.e. strongly bend arrow).
     */
    var indications: [String]?
    
    /**
     A boolean flag indicating whether the lane is a valid choice in the current maneuver.
     */
    var valid: Bool?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case indications
        case valid
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let lane = try decoder.container(keyedBy: Lane.CodingKeys.self)
        indications = try lane.decodeIfPresent([String].self, forKey: .indications)
        valid = try lane.decodeIfPresent(Bool.self, forKey: .valid)
    }
}
