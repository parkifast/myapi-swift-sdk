//
//  GeocodingApi.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 17/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Geocoding API. This API allows translation between addresses and geographical coordinates.
 */
enum GeocodingApi {
    case direct(_ address: String, _ sourceLat: Double?, _ sourceLon: Double?)
    case reverse(_ lat: Double, _ lon: Double)
}

extension GeocodingApi: EndPointType {
    
    var baseUrl: URL {
        guard let url = URL(string: NetworkEnvironment.environmentBaseUrl) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .direct:
            return "geocoding/direct"
        case .reverse:
            return "geocoding/reverse"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .direct(let address, let sourceLat, let sourceLon):
            let parameters: [String:Any]
            if (sourceLat != nil && sourceLon != nil) {
                parameters = ["q": address, "source_lat": sourceLat!, "source_lon": sourceLon!]
            } else {
                parameters = ["q": address]
            }
            return .requestParametersAndHeaders(
                bodyParameters: nil,
                urlParameters: parameters,
                additionHeaders: nil)
        case .reverse(let lat, let lon):
            return .requestParametersAndHeaders(
                bodyParameters: nil,
                urlParameters: ["lat": lat, "lon": lon],
                additionHeaders: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
