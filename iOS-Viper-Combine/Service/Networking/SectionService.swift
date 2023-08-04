//
//  SectionService.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import Foundation
import Combine
import Moya
import CombineMoya

protocol SectionServiceProtocol {
    
    func getSectionLists() -> AnyPublisher<ResponseModel<SectionModel>, MoyaError>
    
}

final class SectionService {
    
    let provider: BaseMoyaProvider<News>
    
    init(provider: BaseMoyaProvider<News> = BaseMoyaProvider<News>()) {
        self.provider = provider
    }
}


extension SectionService: SectionServiceProtocol {
    
    func getSectionLists() -> AnyPublisher<ResponseModel<SectionModel>, MoyaError> {
        self.provider.requestPublisher(.sectionList)
            .filterSuccessfulStatusAndRedirectCodes()
            .map(ResponseModel<SectionModel>.self)
            .eraseToAnyPublisher()
    }
    
}
