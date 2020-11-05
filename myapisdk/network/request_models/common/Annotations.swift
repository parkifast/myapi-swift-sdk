//
//  Annotations.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 06/07/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Supported matrix annotations: duration, distance or all. Any of those can be used for matrix calculation.
 */
public enum Annotations: String {
    /**
     Duration matrix table.
     */
    case duration
    /**
     Distance matrix table.
     */
    case distance
    /**
     Both duration and distance matrix tables.
     */
    case all = "duration,distance"
}
