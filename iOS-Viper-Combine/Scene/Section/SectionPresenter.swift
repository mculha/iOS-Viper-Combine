//
//  SectionPresenter.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import Foundation
import Combine

final class SectionPresenter: PresenterProtocol {    
    var interactor: SectionInteractor!
    weak var view: SectionViewController?
    var router: SectionRouter
    
    private var store: Set<AnyCancellable> = .init()
    var sections: CurrentValueSubject<[SectionModel], Never> = .init([])
    
    init(router: SectionRouter) {
        self.router = router
    }
    
    private func setupBindings() {
        self.interactor
            .getSectionList()
            .receive(on: DispatchQueue.main)
            .map { response in return response.results ?? [] }
            .replaceError(with: [])
            .assign(to: \.value, on: sections)
            .store(in: &store)
    }

}
