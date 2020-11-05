//
//  NetworkRouter.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 15/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

public typealias NetworkRouterCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> ()
public typealias DeserializedModelCompletion<T> = (_ model: T?) -> ()
public typealias ErrorCompletion = (_ error: String?) -> ()

protocol NetworkRouter: class {
    associatedtype EndPoint: EndPointType
    func request<T: Codable>(route: EndPoint, responseType: T.Type, onSuccess: @escaping DeserializedModelCompletion<T>, onError: @escaping ErrorCompletion)
    func cancel()
}
