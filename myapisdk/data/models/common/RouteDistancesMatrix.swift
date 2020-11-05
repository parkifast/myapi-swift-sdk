//
//  RouteDistancesMatrix.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 06/07/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Distances matrix. Computed travel distance matrix, in meters, from every source to every destination.
 */
public struct RouteDistancesMatrix: Codable {
    
    /**
     Distances matrix. Computed travel time matrix, in meters, from every source to every destination.
     */
    var distances: [[Double]]?
    
}
