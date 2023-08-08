//
//  SectionDetailViewController.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 8.08.2023.
//

import UIKit

class SectionDetailViewController: UIViewController, ViewProtocol {    

    var presenter: SectionDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        self.setupUI()
        self.setupBindings()
    }
    
    private func setupBindings() {
        //TODO Build Here
    }
    
    private func setupUI() {
        //TODO Build Here
    }
}
