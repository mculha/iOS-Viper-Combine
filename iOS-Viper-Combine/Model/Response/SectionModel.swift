//
//  SectionModel.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import Foundation

struct SectionModel: Decodable {
    let section: String?
    let displayName: String?
    
    enum CodingKeys: String, CodingKey {
        case section
        case displayName = "display_name"
    }
}
