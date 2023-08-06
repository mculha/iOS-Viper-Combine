//
//  SectionViewController.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import UIKit
import Combine

class SectionViewController: UIViewController, ViewProtocol {
    
    var presenter: SectionPresenter!
    private var store: Set<AnyCancellable> = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBindings()
    }
    
    private func setupBindings() {
        self.presenter
            .sections
            .sink { _ in
                
            }
            .store(in: &store)
    }

}
