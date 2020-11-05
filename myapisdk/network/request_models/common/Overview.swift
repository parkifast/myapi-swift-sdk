//
//  Overview.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 30/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Possibilities for route overview. By default it will be simplified (according to highest zoom level it could be displayed on), but it can also be set to full (full intersections list regardless of zoom level) or false (no overview at all)
 */
public enum Overview: String {
    /**
     Highest zoom level it can be displayed on.
     */
    case simplified
    /**
     Full intersections regardless of zoom level.
     */
    case full
    /**
     No overview at all.
     */
    case none = "false"
}
