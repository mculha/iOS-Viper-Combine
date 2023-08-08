//
//  SectionDetailViewController.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 8.08.2023.
//

import UIKit

class SectionDetailViewController: UIViewController, ViewProtocol {    

    
    @IBOutlet private weak var lblTitle: UILabel!
    
    var presenter: SectionDetailPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblTitle.text = presenter.section
    }
}
