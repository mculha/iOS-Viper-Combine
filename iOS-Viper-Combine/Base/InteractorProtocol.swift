//
//  Interactor.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 3.08.2023.
//

import Foundation

protocol InteractorProtocol {
    associatedtype P: PresenterProtocol
    
    var presenter: P? { get }
    
    init(presenter: P)
}
