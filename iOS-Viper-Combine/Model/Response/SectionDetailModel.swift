//
//  SectionDetailModel.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 8.08.2023.
//

import Foundation

class SectionDetailModel: Decodable {
    let title: String?
    let abstract: String?
    let source: String?
    
    let multimedia: [ImageModel]?
    
    var image: ImageModel? {
        return multimedia?.sorted { $0.height ?? 0 > $1.height ?? 0 }.first
    }
}
