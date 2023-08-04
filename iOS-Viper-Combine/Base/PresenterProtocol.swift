//
//  BasePresenter.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 3.08.2023.
//

import Foundation
import UIKit

protocol PresenterProtocol {
    associatedtype I: InteractorProtocol
    associatedtype V: ViewProtocol
    associatedtype R: RouterProtocol

    var interactor: I! { get }
    var view: V? { get }
    var router: R { get }
    
    init(router: R)
    
}
