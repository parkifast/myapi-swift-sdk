//
//  NetworkEnvironment.swift
//  myapisdk
//
//  Created by Alberto Rodriguez Sanchez on 15/04/2020.
//  Copyright © 2020 Parkifast Spain S.L. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case production
}

extension NetworkEnvironment {
    
    static var environmentBaseUrl : String {
        switch NetworkManager.environment {
        case .production:
            return "https://m.api.mymappi.com/v1/"
        }
    }
    
}
