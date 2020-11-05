//
//  RouteDuratiosMatrix.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 27/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Durations matrix. Computed travel time matrix from every source to every destination.
 */
public struct RouteDurationsMatrix: Codable {
    
    /**
     Durations matrix. Computed travel time matrix from every source to every destination.
     */
    var durations: [[Double]]?
    
}
