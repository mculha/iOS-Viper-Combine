//
//  SectionDetailCell.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 9.08.2023.
//

import UIKit
import Kingfisher

class SectionDetailCell: UITableViewCell {

    @IBOutlet private weak var imgDetail: UIImageView!
    @IBOutlet private weak var lblTitle: UILabel!
    @IBOutlet private weak var lblAbstract: UILabel!
    
    func setupCell(model: SectionDetailModel) {
        if let url = model.image?.url, let imageUrl = URL(string: url) {
            self.imgDetail.kf.setImage(with: imageUrl)
        }
        self.imgDetail.cornerRadius = 5
        self.lblTitle.text = model.title
        self.lblAbstract.text = model.abstract
    }
}
