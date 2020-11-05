//
//  HTTPTask.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 15/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Data?, urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Data?, urlParameters: Parameters?, additionHeaders: HTTPHeaders?)
}
