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
        
        let presenter: SectionDetailPresenter = .init(router: .init(), interactor: .init(), section: section)
        let view: SectionDetailViewController = SectionDetailViewController.instantiate()
        
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
}
