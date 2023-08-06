//
//  SectionCell.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 6.08.2023.
//

import UIKit

class SectionCell: UITableViewCell {

    @IBOutlet private weak var lblSection: UILabel!
    
    func setupCell(model: SectionModel) {
        self.lblSection.text = model.displayName
    }
}
