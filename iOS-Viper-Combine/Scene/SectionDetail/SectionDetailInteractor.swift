//
//  SectionDetailInteractor.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 8.08.2023.
//

import Foundation

final class SectionDetailInteractor: InteractorProtocol {
    
    weak var presenter: SectionDetailPresenter?
    
    init(presenter: SectionDetailPresenter) {
        self.presenter = presenter
    }
    
    
}
