//
//  Source.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 30/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Supported values for source parameter in the traveling salesman request.
 */
public enum Source: String {
    /**
     Return route starts at any coordinate.
     */
    case any
    /**
     Return route starts at first coordinate.
     */
    case first
}
