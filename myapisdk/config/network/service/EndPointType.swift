//
//  EndPointType.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 15/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseUrl: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}
