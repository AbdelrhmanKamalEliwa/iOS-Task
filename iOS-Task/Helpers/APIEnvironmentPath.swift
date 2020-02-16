//
//  APIEnvironmentPath.swift
//  iOS-Task
//
//  Created by Abdelrhman Eliwa on 2/16/20.
//  Copyright © 2020 Abdelrhman Eliwa. All rights reserved.
//

import Foundation

struct APIService {
    static func baseURL() -> String
    {
        return APIEnvironmentPath.development.scheme() + APIEnvironmentPath.development.host()
    }
}

enum APIEnvironmentPath {
    
    case development
    case testing
    case production
    
    func scheme() -> String
    {
        switch self
        {
        case .development:
            return "https://"
        case .testing:
            return ""
        case .production:
            return ""
        }
    }
    
    func host() -> String
    {
        switch self
        {
            case .development:
                return "pixabay.com"
            case .testing:
                return ""
            case .production:
                return ""
        }
    }
}
