//
//  SectionDetailPresenter.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 8.08.2023.
//

import Foundation
import Combine
import Moya

final class SectionDetailPresenter: PresenterProtocol {

    var interactor: SectionDetailInteractor
    weak var view: SectionDetailViewController?
    var router: SectionDetailRouter
    
    private var section: String
    
    private var store: Set<AnyCancellable> = .init()
    var sectionDetails: CurrentValueSubject<[SectionDetailModel], Never> = .init([])
    var error: PassthroughSubject<String, Never> = .init()
    
    init(router: SectionDetailRouter, interactor: SectionDetailInteractor) {
        self.section = ""
        self.router = router
        self.interactor = interactor
    }

    convenience init(router: SectionDetailRouter, interactor: SectionDetailInteractor, section: String) {
        self.init(router: router, interactor: interactor)
        self.section = section
    }
    
    func viewDidLoad() {
        self.setupBindings()
    }
    
    private func setupBindings() {
        self.interactor
            .getSectionDetail(section: section)
            .receive(on: DispatchQueue.main)
            .map { response in return response.results ?? [] }
            .mapError { response in return ResponseErrorModel(error: response) }
            .catch { error -> AnyPublisher<[SectionDetailModel], Never> in
                self.error.send(error.message)
                return Just([]).eraseToAnyPublisher()
            }
            .assign(to: \.value, on: sectionDetails)
            .store(in: &store)
    }
    
}

