//
//  NewsProvider.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import Foundation
import Moya


enum News {
    case sectionList
    case sectionDetail(section: String)
}

extension News: TargetType {
    var baseURL: URL {
        return URL(string: Constant.BASE_URL)!
    }
    
    var path: String {
        switch self {
        case .sectionList:
            return "section-list.json"
        case .sectionDetail(section: let section):
            return String(format: "all/%@.json", section)
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        let params: [String: String] = ["api-key": Constant.API_KEY_NY]
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}
