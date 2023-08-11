//
//  ResponseErrorModel.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 11.08.2023.
//

import Foundation
import Moya

struct ResponseErrorModel: Error {
    
    let error: MoyaError
    
    var message: String {
        guard let data = error.response?.data else { return "An error occured. Please try again" }
        let fault = try? JSONDecoder().decode(FaultModel.self, from: data)
        return fault?.fault?.faultString ?? "An error occured. Please try again"
    }
}
