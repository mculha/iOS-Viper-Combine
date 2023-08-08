//
//  SectionDetailPresenter.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 8.08.2023.
//

import Foundation

final class SectionDetailPresenter: PresenterProtocol {

    var interactor: SectionDetailInteractor!
    weak var view: SectionDetailViewController?
    var router: SectionDetailRouter
    
    var section: String
    
    init(router: SectionDetailRouter) {
        self.section = ""
        self.router = router
    }
    
    convenience init(router: SectionDetailRouter, section: String) {
        self.init(router: router)
        self.section = section
    }
    
    func viewDidLoad() {
        
    }
    
}
