//
//  ZhukEndPoint.swift
//  EvoZhuk
//
//  Created by Dima Senchik on 7/7/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case test
    case production
    
    var basePath: String {
        switch self {
        case .test:
            return "http://prom.ua/_/graph"
        case .production:
            return "http://prom.ua/_/graph"
        }
    }
}

final class RequestBuilder {

    enum RequestPath {
        case getDresses
        
        var path: String {
            switch self {
            case .getDresses:
                return "/request"
            }
        }
    }

    enum HeadersType {
        case typical
        case custom
    }
    
    static func build(_ httpMethod: HTTPMethod = .get , baseUrl: String = NetworkConfiguration.baseEnvironment.basePath, urlAppending: String = "", headersType: HeadersType, body: String? = nil, requestType: RequestPath) -> URLRequest {
        
        let configuredURL = URL(string: "\(baseUrl)\(requestType.path)\(urlAppending)")
        
        var httpBody: Data? = nil
        
        if let requestURL = configuredURL {
            
            if body != nil {
                httpBody = body?.data(using: .utf8, allowLossyConversion: false)
            }
            var request = URLRequest(url: requestURL)
            configureRequestHeaders(type: headersType, request: &request)
            request.httpMethod = httpMethod.rawValue
            request.httpBody = httpBody
            
            return request
        }
        
        return URLRequest(url: URL(string: "")!)
    }
}

// MARK: - Private methods
private extension RequestBuilder {
    static func configureRequestHeaders(type: HeadersType, request: inout URLRequest) {
        switch type {
        case .typical:
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        case .custom:
            request.setValue("Custom field", forHTTPHeaderField: "http header field")
        }
    }
}
