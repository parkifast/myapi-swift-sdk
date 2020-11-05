//
//  Router.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 15/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

class Router<EndPoint: EndPointType>: NetworkRouter {
    private var task: URLSessionTask?
    
    func request<T: Codable>(route: EndPoint, responseType: T.Type, onSuccess: @escaping DeserializedModelCompletion<T>, onError: @escaping ErrorCompletion) -> () {
        let session = URLSession.shared
        do {
            let request = try self.buildRequest(from: route)
            let task = session.dataTask(with: request) { (data, response, error) in
                self.handleCompletion(data, responseType, response, error, onSuccess: {data in onSuccess(data)}, onError: {error in onError(error)})
            }
            task.resume()
        } catch {
            onError("There was an error in the network request")
        }
    }
    
    func cancel() {
        self.task?.cancel()
    }
    
    fileprivate func buildRequest(from route: EndPoint) throws -> URLRequest {
        
        var request = URLRequest(url: route.baseUrl.appendingPathComponent(route.path),
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: 10.0)
        
        request.httpMethod = route.httpMethod.rawValue
        do {
            switch route.task {
            case .request:
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            case .requestParameters(let bodyParameters,
                                    let urlParameters):
                try self.configureParameters(bodyParameters: bodyParameters,
                                             urlParameters: urlParameters,
                                             request: &request)
            case .requestParametersAndHeaders(let bodyParameters,
                                              let urlParameters,
                                              let additionalHeaders):
                self.addAdditionalHeaders(additionalHeaders, request: &request)
                try self.configureParameters(bodyParameters: bodyParameters,
                                             urlParameters: urlParameters,
                                             request: &request)
            }
            return request
        } catch {
            throw error
        }
    }
    
    fileprivate func configureParameters(bodyParameters: Data?,
                                         urlParameters: Parameters?,
                                         request: inout URLRequest) throws {
        do {
            if let bodyParameters = bodyParameters {
                request.httpBody = bodyParameters
            }
            if let urlParameters = urlParameters {
                try URLParameterEncoder.encode(urlRequest: &request, with: urlParameters)
            }
        } catch {
            throw error
        }
    }
    
    fileprivate func addAdditionalHeaders(_ additionalHeaders: HTTPHeaders?, request: inout URLRequest) {
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(NetworkManager.SdkSecurityHeaderValue, forHTTPHeaderField: NetworkManager.SdkSecurityHeaderName)
        request.addValue(NetworkManager.SdkApiKeyHeaderValue, forHTTPHeaderField: NetworkManager.SdkApiKeyHeaderName)
        guard let headers = additionalHeaders else { return }
        for (key, value) in headers {
            request.addValue(value, forHTTPHeaderField: key)
        }
    }
    
    fileprivate func handleCompletion<T: Codable>(_ data: Data?, _ responseType: T.Type, _ response: URLResponse?, _ error: Error?,
                                      onSuccess: @escaping DeserializedModelCompletion<T>,
                                      onError: @escaping ErrorCompletion) -> () {
        if (error != nil) {
            onError("Please check your network connection.")
        }
        if let response = response as? HTTPURLResponse {
            let result = NetworkManager.handleNetworkResponse(response)
            switch result {
            case .success:
                guard let responseData = data else {
                    onError(NetworkResponse.noData.rawValue)
                    return
                }
                do {
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                    let response = try jsonDecoder.decode(responseType, from: responseData)
                    onSuccess(response)
                } catch {
                    onError(NetworkResponse.unableToDecode.rawValue)
                }
            case .failure(let networkFailureError):
                onError(networkFailureError)
            }
        }
    }
}
