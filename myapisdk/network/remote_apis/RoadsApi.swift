//
//  RoadsApi.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 23/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
* Roads API. This API allows querying information about the road network.
*/
enum RoadsApi{
    case snap(_ lat: Double, _ lon: Double)
    case highwayType(_ lat: Double, _ lon: Double)
    case speedLimit(_ lat: Double, _ lon: Double)
    case distance(_ lat: Double, _ lon: Double)
    case nearest(_ lat: Double, _ lon: Double)
}

extension RoadsApi: EndPointType {
    
    var baseUrl: URL {
        guard let url = URL(string: NetworkEnvironment.environmentBaseUrl) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .snap:
            return "roads/snap"
        case .highwayType:
            return "roads/highway-type"
        case .speedLimit:
            return "roads/speed-limit"
        case .distance:
            return "roads/distance"
        case .nearest:
            return "roads/nearest"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .snap(let lat, let lon):
            return .requestParametersAndHeaders(
                bodyParameters: nil,
                urlParameters: ["lat": lat, "lon": lon],
                additionHeaders: nil)
        case .highwayType(let lat, let lon):
            return .requestParametersAndHeaders(
                bodyParameters: nil,
                urlParameters: ["lat": lat, "lon": lon],
                additionHeaders: nil)
        case .speedLimit(let lat, let lon):
            return .requestParametersAndHeaders(
                bodyParameters: nil,
                urlParameters: ["lat": lat, "lon": lon],
                additionHeaders: nil)
        case .distance(let lat, let lon):
            return .requestParametersAndHeaders(
                bodyParameters: nil,
                urlParameters: ["lat": lat, "lon": lon],
                additionHeaders: nil)
        case .nearest(let lat, let lon):
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
