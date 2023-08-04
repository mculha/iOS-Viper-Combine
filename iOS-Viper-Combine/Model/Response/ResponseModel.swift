//
//  ResponseModel.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import Foundation

struct ResponseModel<T: Decodable>: Decodable {
    let status: String?
    let results: [T]?
}
