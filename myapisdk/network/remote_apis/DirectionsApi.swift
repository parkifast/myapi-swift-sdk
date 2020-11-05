//
//  DirectionsApi.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 24/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

/**
 Directions API. This API allows route calculations on different profiles (car, pedestrian, bike...)
 */
enum DirectionsApi {
    case route(
        _ profile: Profile,
        _ orig: Any,
        _ dest: Any,
        _ wps: Any?,
        _ alternatives: Bool,
        _ steps: Bool,
        _ geometries: GeometryType,
        _ overview: Overview
    )
    case matrix(
        _ profile: Profile,
        _ coordinates: Any,
        _ sources: Any?,
        _ destinations: Any?,
        _ annotations: Annotations?
    )
    case travelingSalesman(
        _ profile: Profile,
        _ coordinates: Any,
        _ roundTrip: Bool,
        _ source: Source,
        _ destination: Destination,
        _ steps: Bool,
        _ geometries: GeometryType,
        _ overview: Overview
    )
}

extension DirectionsApi: EndPointType {
    
    var baseUrl: URL {
        guard let url = URL(string: NetworkEnvironment.environmentBaseUrl) else { fatalError("baseURL could not be configured.") }
        return url
    }
    
    var path: String {
        switch self {
        case .route(let profile, _, _, _, _, _, _, _):
            return "directions/route/\(profile.rawValue)"
        case .matrix(let profile, let coordinates, _, _, _):
            var coordinatesString = ""
            if let coor = coordinates as? String {
                coordinatesString = coor
            } else if let coor = coordinates as? [Coordinate] {
                for (i, coordinate) in coor.enumerated() {
                    if i != 0 {
                        coordinatesString += ";"
                    }
                    coordinatesString += String(describing: coordinate)
                }
            }
            return "directions/matrix/\(profile.rawValue)/\(coordinatesString)"
        case .travelingSalesman(let profile, let coordinates, _, _, _, _, _, _):
            var coordinatesString = ""
            if let coor = coordinates as? String {
                coordinatesString = coor
            } else if let coor = coordinates as? [Coordinate] {
                for (i, coordinate) in coor.enumerated() {
                    if i != 0 {
                        coordinatesString += ";"
                    }
                    coordinatesString += String(describing: coordinate)
                }
            }
            return "directions/traveling-salesman/\(profile.rawValue)/\(coordinatesString)"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .route(_, let orig, let dest, let wps, let alternatives, let steps, let geometries, let overview):
            var originString = ""
            if let origin = orig as? String {
                originString = origin
            } else if let origin = orig as? Coordinate {
                originString = String(describing: origin)
            }
            var destString = ""
            if let destination = dest as? String {
                destString = destination
            } else if let destination = dest as? Coordinate {
                destString = String(describing: destination)
            }
            var wpsString = ""
            if let waypoints = wps as? String {
                wpsString = waypoints
            } else if let waypoints = wps as? Coordinate {
                wpsString = String(describing: waypoints)
            } else if let waypoints = wps as? [Coordinate] {
                for (i, wp) in waypoints.enumerated() {
                    if i != 0 {
                        wpsString += ";"
                    }
                    wpsString += String(describing: wp)
                }
            }
            var parameters: [String:Any] = [
                "orig": originString,
                "dest": destString,
                "alternatives": alternatives,
                "steps": steps,
                "geometries": geometries,
                "overview": overview.rawValue
            ]
            if (wpsString != "") {
                parameters["wps"] = wpsString
            }
            return .requestParametersAndHeaders(
                bodyParameters: nil,
                urlParameters: parameters,
                additionHeaders: nil)
        case .matrix(_, _, let sources, let destinations, let annotations):
            var parameters: [String:Any] = [:]
            if (sources != nil) {
                var sourcesString = ""
                if let sou = sources as? String {
                    sourcesString = sou
                } else if let sou = sources as? Int {
                    sourcesString = "\(sou)"
                } else if let sou = sources as? [Int] {
                    for (i, source) in sou.enumerated() {
                        if i != 0 {
                            sourcesString += ";"
                        }
                        sourcesString += "\(source)"
                    }
                }
                parameters["sources"] = sourcesString
            }
            if (destinations != nil) {
                var destinationsString = ""
                if let dest = destinations as? String {
                    destinationsString = dest
                } else if let dest = destinations as? Int {
                    destinationsString = "\(dest)"
                }
                else if let dest = destinations as? [Int] {
                    for (i, destination) in dest.enumerated() {
                        if i != 0 {
                            destinationsString += ";"
                        }
                        destinationsString += "\(destination)"
                    }
                }
                parameters["destinations"] = destinationsString
            }
            parameters["annotations"] = annotations?.rawValue
            return .requestParametersAndHeaders(
                bodyParameters: nil,
                urlParameters: parameters,
                additionHeaders: nil)
        case .travelingSalesman(_, _, let roundtrip, let source, let destination, let steps, let geometries, let overview):
            return .requestParametersAndHeaders(
                bodyParameters: nil,
                urlParameters: [
                    "roundtrip": roundtrip,
                    "source": source,
                    "destination": destination,
                    "steps": steps,
                    "geometries": geometries,
                    "overview": overview.rawValue
                ],
                additionHeaders: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
