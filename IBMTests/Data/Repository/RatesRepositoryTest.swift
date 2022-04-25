//
//  RatesRepositoryTest.swift
//  IBMTests
//
//  Created by Carles Garcia Puigardeu on 25/4/22.
//

import XCTest

@testable import IBM

class RatesRepositoryTest: XCTestCase {
    var mockApiManager: MockApiManager!
    var sut: DefaultRatesRepository!
    
    override func setUp() {
        mockApiManager = MockApiManager()
        sut = DefaultRatesRepository(apiManager: mockApiManager)
    }

    func test_get_rates() throws {
        let mockRate = RateResponseDTO(from: "USD", to: "EUR", rate: "10")
        let mockResponse = [mockRate, mockRate]
       
        // given
        mockApiManager.getRates.result = .success(mockResponse)
        
        // when
        let captor = CompletionResultCaptor<[Rate]>(testCase: self)
        sut.getRates(completion: captor.capture())
        let result = captor.waitAndGet()
        
        // then
        XCTAssertNil(captor.error())
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.count, mockResponse.count)
    }
}
