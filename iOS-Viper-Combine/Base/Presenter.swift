//
//  BasePresenter.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 3.08.2023.
//

import Foundation
import UIKit

protocol Presenter {
    associatedtype V: UIViewController

    init(interactor: Interactor, view: V, router: Router)
    
}
