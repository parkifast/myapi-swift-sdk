//
//  NetworkManager.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 15/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

enum NetworkResponse: String {
    case success
    case badRequest = "The request is malformed, either because you have specified an unsupported parameter or because you have missed a required parameter."
    case unauthorized = "Unauthorized access. You need to specify a valid api key as ‘api_key’ param in order to use this service. If you don’t have one, please sign up for a subscription that fits your business at https://mymappi.com/pricing."
    case forbidden = "Forbidden access. This happens when the specified api key has been restricted, either via IP restriction or because it has been disabled by your administrator. Please contact your administrator or visit your dashboard to fix this. You can hit our support team through your dashboard as well if you need help."
    case noResults = "No results. The request was successfully handled, however there were no results associated with those parameters. Therefore this request would count as a billable transaction."
    case tooManyRequests = "Too many requests. This happens when the specified api key is out of quota. Either due to the requests per second limitation or because the daily limit has been reached. Please visit our pricing page at https://mymappi.com/pricing and choose a higher subscription that fits your business needs. You can upgrade your subscription straight from your dashboard as well."
    case serverError = "There was an error while making the request. Please, try again in a few seconds. If the problem persists, please log in to your dashboard account and contact us."
    case noData = "Response returned with no data."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager {
    
    static let environment : NetworkEnvironment = .production
    static let AuthorizationHeader = "Authorization"
    static let SdkSecurityHeaderName = "SdkSecKey"
    static let SdkSecurityHeaderValue = "8d97da48fe57de23ff010c8ada758ab4b16c5cfb6f3c37b997d969d816e6117883d6661c87ccfffa0f2163e48111e977f070cb9a41e99629b62d2b0e07cfff0e"
    static let SdkApiKeyHeaderName = "ApiKey"
    static let SdkApiKeyHeaderValue = Bundle.main.infoDictionary?["MyapiToken"] as! String
    
    static func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 400: return .failure(NetworkResponse.badRequest.rawValue)
        case 401: return .failure(NetworkResponse.unauthorized.rawValue)
        case 403: return .failure(NetworkResponse.forbidden.rawValue)
        case 404: return .failure(NetworkResponse.noResults.rawValue)
        case 429: return .failure(NetworkResponse.tooManyRequests.rawValue)
        default: return .failure(NetworkResponse.serverError.rawValue)
        }
    }
    
}
