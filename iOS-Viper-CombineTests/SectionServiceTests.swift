//
//  SectionServiceTests.swift
//  iOS-Viper-CombineTests
//
//  Created by Melih Çulha on 7.08.2023.
//

import XCTest
import Combine
@testable import iOS_Viper_Combine

final class SectionServiceTests: XCTestCase {

    private var service: SectionServiceProtocol!
    private var store: Set<AnyCancellable>!
    
    override func setUpWithError() throws {
        self.store = .init()
        self.service = SectionService()
    }

    override func tearDownWithError() throws {
        service = nil
        store = nil
        try super.tearDownWithError()
    }
    
    func testSectionService() throws {
        
        let expectation = XCTestExpectation(description: "Receiving the Sections")
        
        self.service
            .getSectionList()
            .receive(on: DispatchQueue.main)
            .map { response in return response.results ?? [] }
            .replaceError(with: [])
            .sink { sections in
                XCTAssertNotNil(sections)
                XCTAssertGreaterThan(sections.count, 0)
                expectation.fulfill()
            }
            .store(in: &store)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testSectionDetailService() throws {
        let expectation = XCTestExpectation(description: "Receiving the Section Detail")
        
        self.service
            .getSectionDetail(section: "arts")
            .receive(on: DispatchQueue.main)
            .map { response in return response.results ?? [] }
            .replaceError(with: [])
            .sink { sections in
                XCTAssertNotNil(sections)
                XCTAssertGreaterThan(sections.count, 0)
                XCTAssertNotNil(sections.first)
                XCTAssertNotNil(sections.first?.multimedia)
                XCTAssertNotNil(sections.first?.image)
                XCTAssertNotNil(sections.first?.image?.url)
                XCTAssertNotNil(sections.first?.image?.height)
                XCTAssertNotNil(sections.first?.image?.width)
                XCTAssertGreaterThan(sections.first?.multimedia?.count ?? 0, 0)
                
                expectation.fulfill()
            }
            .store(in: &store)
        
        wait(for: [expectation], timeout: 5)
    }
}
