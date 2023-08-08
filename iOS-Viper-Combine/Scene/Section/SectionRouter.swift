//
//  SectionRouter.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import Foundation
import UIKit

final class SectionRouter: RouterProtocol {
    
    class func createSection() -> UIViewController {
        let view: SectionViewController = SectionViewController.instantiate()

        let presenter = SectionPresenter(router: .init())
        let interactor = SectionInteractor(presenter: presenter)
        presenter.interactor = interactor
        
        view.presenter = presenter
        presenter.view = view
        
        
        return view
    }
    
    func push(vc: UIViewController, navigationController: UINavigationController?) {
        navigationController?.pushViewController(vc, animated: true)
    }
}
