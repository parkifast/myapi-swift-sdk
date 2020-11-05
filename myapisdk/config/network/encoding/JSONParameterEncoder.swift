//
//  JSONParameterEncoder.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 15/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

public struct JSONParameterEncoder: ParameterEncoder {
    public static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            urlRequest.httpBody = jsonAsData
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            if urlRequest.value(forHTTPHeaderField: NetworkManager.SdkSecurityHeaderName) == nil {
                urlRequest.setValue(NetworkManager.SdkSecurityHeaderValue, forHTTPHeaderField: NetworkManager.SdkSecurityHeaderName)
            }
            if urlRequest.value(forHTTPHeaderField: NetworkManager.SdkApiKeyHeaderName) == nil {
                urlRequest.setValue(NetworkManager.SdkApiKeyHeaderValue, forHTTPHeaderField: NetworkManager.SdkApiKeyHeaderName)
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}

extension JSONEncoder.DateEncodingStrategy {
    static let iso8601withFractionalSeconds = custom {
        var container = $1.singleValueContainer()
        try container.encode(DateFormatter.iso8601Full.string(from: $0))
    }
}

extension DateFormatter {
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.locale = Locale(identifier: "es_ES")
        return formatter
    }()
}
