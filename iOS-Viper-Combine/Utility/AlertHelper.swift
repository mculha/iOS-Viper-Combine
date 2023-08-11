//
//  AlertHelper.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 11.08.2023.
//

import Foundation
import UIKit

struct AlertHelper {
    
    
    static func showAlert(on vc: UIViewController, title: String? = nil, message: String, completion: ((UIAlertAction) -> (Void))? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: completion))
        vc.present(alert, animated: true)
    }
}
