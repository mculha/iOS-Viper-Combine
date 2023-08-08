//
//  SectionDetailRouter.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 8.08.2023.
//

import Foundation
import UIKit

final class SectionDetailRouter: RouterProtocol {
    
    class func createSectionDetail(section: String) -> UIViewController {
        
        let presenter: SectionDetailPresenter = .init(router: .init(), section: section)
        let interactor: SectionDetailInteractor = .init(presenter: presenter)
        let view: SectionDetailViewController = SectionDetailViewController.instantiate()
        
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
}
