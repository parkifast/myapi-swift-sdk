//
//  SearchPlacesResult.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 27/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Represents a single result of a Search Places API response.
 */
public struct SearchPlacesResult: Codable {
    
    /**
     The found place location.
     */
    var location: Coordinate?
    
    /**
     List of attributes describing the place.
     */
    var tags: [String: String]?
    
    /// :nodoc:
    enum CodingKeys: String, CodingKey {
        case tags
    }
    
    /// :nodoc:
    public init(from decoder: Decoder) throws {
        let searchPlacesResult = try decoder.container(keyedBy: SearchPlacesResult.CodingKeys.self)
        location = try Coordinate(from: decoder)
        let tagsContainer = try searchPlacesResult.decodeIfPresent([String: String].self, forKey: .tags)
        tags = [:]
        for (key, value) in tagsContainer! {
            tags![key] = value
        }
    }
}
