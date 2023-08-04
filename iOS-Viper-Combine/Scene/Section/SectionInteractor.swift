//
//  SectionInteractor.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import Foundation

final class SectionInteractor: InteractorProtocol {

    weak var presenter: SectionPresenter?

    init(presenter: SectionPresenter) {
        self.presenter = presenter
    }
}
