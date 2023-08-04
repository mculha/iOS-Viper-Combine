//
//  SectionPresenter.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import Foundation

final class SectionPresenter: PresenterProtocol {    
    var interactor: SectionInteractor!
    weak var view: SectionViewController?
    var router: SectionRouter
    
    init(router: SectionRouter) {
        self.router = router
    }
    
}
