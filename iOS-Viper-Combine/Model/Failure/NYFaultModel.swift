//
//  NYFaultModel.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 11.08.2023.
//

import Foundation

struct NYFaultModel: Decodable {
    let faultString: String?
    
    enum CodingKeys: String, CodingKey {
        case faultString = "faultstring"
    }
}
