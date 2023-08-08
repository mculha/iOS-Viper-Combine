//
//  SectionDetailInteractor.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 8.08.2023.
//

import Foundation
import Combine
import Moya

final class SectionDetailInteractor: InteractorProtocol {
    
    weak var presenter: SectionDetailPresenter?
    private let service: SectionServiceProtocol

    init(presenter: SectionDetailPresenter) {
        self.presenter = presenter
        self.service = SectionService()
    }
    
    func getSectionDetail(section: String) -> AnyPublisher<ResponseModel<SectionDetailModel>, MoyaError> {
        return service.getSectionDetail(section: section)
    }
    
}
