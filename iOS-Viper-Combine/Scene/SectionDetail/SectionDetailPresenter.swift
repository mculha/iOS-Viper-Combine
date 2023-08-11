//
//  SectionDetailPresenter.swift
//  iOS-Viper-Combine
//
//  Created by Melih Çulha on 8.08.2023.
//

import Foundation
import Combine
import Moya

final class SectionDetailPresenter: PresenterProtocol {

    var interactor: SectionDetailInteractor!
    weak var view: SectionDetailViewController?
    var router: SectionDetailRouter
    
    private var section: String
    
    private var store: Set<AnyCancellable> = .init()
    var sectionDetails: CurrentValueSubject<[SectionDetailModel], Never> = .init([])
    var error: PassthroughSubject<String, Never> = .init()
    
    init(router: SectionDetailRouter) {
        self.section = ""
        self.router = router
    }
    
    convenience init(router: SectionDetailRouter, section: String) {
        self.init(router: router)
        self.section = section
    }
    
    func viewDidLoad() {
        self.setupBindings()
    }
    
    private func setupBindings() {
        self.interactor
            .getSectionDetail(section: section)
            .receive(on: DispatchQueue.main)
            .map { response in return response.results ?? [] }
            .mapError { response in return NyTimesError(error: response) }
            .catch { error -> AnyPublisher<[SectionDetailModel], Never> in
                self.error.send(error.message)
                return Just([]).eraseToAnyPublisher()
            }
            .assign(to: \.value, on: sectionDetails)
            .store(in: &store)
    }
    
}

struct NyTimesError: Error {
    
    let error: MoyaError
    
    var message: String {
        guard let data = error.response?.data else { return "An error occured. Please try again" }
        let fault = try? JSONDecoder().decode(FaultResponse.self, from: data)
        return fault?.fault?.faultString ?? "An error occured. Please try again"
    }
}

struct NYFaultResponse: Decodable {
    let faultString: String?
    
    enum CodingKeys: String, CodingKey {
        case faultString = "faultstring"
    }
}

struct FaultResponse: Decodable {
    let fault: NYFaultResponse?
}
