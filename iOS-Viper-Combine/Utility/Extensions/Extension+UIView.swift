//
//  Extension+UIView.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 9.08.2023.
//

import Foundation
import UIKit

extension UIView {
    
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        } set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
}
