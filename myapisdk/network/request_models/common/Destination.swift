//
//  Destination.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 30/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Supported values for source parameter in the traveling salesman request.
 */
public enum Destination: String {
    /**
     Return route ends at any coordinate.
     */
    case any
    /**
     Return route ends at last coordinate.
     */
    case last
}
