//
//  CovidSummary.swift
//  FamacashAssesment
//
//  Created by jaipee on 11/07/20.
//  Copyright © 2020 JaiPrakashYadav. All rights reserved.
//

import Foundation

enum NetworkEnvironment {
    case qa
    case production
    case staging
}


enum CovidAPI {
    case covidSummary
}

extension CovidAPI: EndPointType {
    
    var environmentBaseURL: String {
        let envirnoment:  NetworkEnvironment = .production
        switch envirnoment {
        case .production: return "https://api.covid19api.com/"
        case .qa: return "https://api.covid19api.com/"
        case .staging: return "https://api.covid19api.com/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURl coud not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .covidSummary:
            return "summary"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .covidSummary:
            return .request //.requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
