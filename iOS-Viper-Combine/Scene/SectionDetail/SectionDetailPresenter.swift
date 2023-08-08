//
//  SectionDetailPresenter.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 8.08.2023.
//

import Foundation
import Combine

final class SectionDetailPresenter: PresenterProtocol {

    var interactor: SectionDetailInteractor!
    weak var view: SectionDetailViewController?
    var router: SectionDetailRouter
    
    private var section: String
    
    private var store: Set<AnyCancellable> = .init()
    var sectionDetails: CurrentValueSubject<[SectionDetailModel], Never> = .init([])
    
    init(router: SectionDetailRouter) {
        self.section = ""
        self.router = router
    }
    
    convenience init(router: SectionDetailRouter, section: String) {
        self.init(router: router)
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
            .replaceError(with: [])
            .assign(to: \.value, on: sectionDetails)
            .store(in: &store)
    }
    
}
