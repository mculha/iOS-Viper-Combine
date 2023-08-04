//
//  ViewProtocol.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 4.08.2023.
//

import Foundation

protocol ViewProtocol {
    associatedtype P: PresenterProtocol
    
    var presenter: P! { get }
    
}
