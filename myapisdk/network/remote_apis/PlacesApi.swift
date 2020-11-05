//
//  PlacesApi.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 27/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Places API. This API allows querying for points of interest around a specific set of coordinates.
 */
enum PlacesApi {
    case search(_ lat: Double, _ lon: Double, _ radius: Int, _ type: String?, _ next: String?, _ limit: Int?)
}

extension PlacesApi: EndPointType {
    
    var baseUrl: URL {
        guard let url = URL(string: NetworkEnvironment.environmentBaseUrl) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .search:
            return "places/search"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .search(let lat, let lon, let radius, let type,  let next, let limit):
            var parameters: [String: Any] = ["lat": lat, "lon": lon, "radius": radius]
            if (type != nil) {
                parameters["type"] = type
            }
            if (next != nil) {
                parameters["next"] = next
            }
            if (limit != nil) {
                parameters["limit"] = limit
            }
            return .requestParametersAndHeaders(
                bodyParameters: nil,
                urlParameters: parameters,
                additionHeaders: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
