//
//  Profile.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 30/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Supported route profiles: car, on_foot and bicycle. Any of those can be used for route calculation.
 */
public enum Profile: String {
    /**
     Use car profile to calculate the route.
     */
    case car
    /**
     Use on_foot profile to calculate the route.
     */
    case on_foot = "pedestrian"
    /**
     Use bicycle profile to calculate the route.
     */
    case bicycle = "bike"
}
