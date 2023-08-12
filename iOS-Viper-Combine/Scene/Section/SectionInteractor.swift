//
//  SectionInteractor.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import Foundation
import Combine
import Moya

final class SectionInteractor: InteractorProtocol {

    private let service: SectionServiceProtocol

    init() {
        self.service = SectionService()
    }
    
    func getSectionList() -> AnyPublisher<ResponseModel<SectionModel>, MoyaError> {
        return service.getSectionList()
    }
}
