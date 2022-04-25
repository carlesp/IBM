//
//  TransactionsRepositoryTest.swift
//  IBMTests
//
//  Created by Carles Garcia Puigardeu on 25/4/22.
//

import XCTest

@testable import IBM

class TransactionsRepositoryTest: XCTestCase {
    var mockApiManager: MockApiManager!
    var sut: DefaultTransactionsRepository!
    
    override func setUp() {
        mockApiManager = MockApiManager()
        sut = DefaultTransactionsRepository(apiManager: mockApiManager)
    }
    
    func test_get_transactions() throws {
        let mockTransaction = TransactionResponseDTO(sku: "K12", amount: "10", currency: "USD")
        let mockResponse = [mockTransaction, mockTransaction]
       
        // given
        mockApiManager.getTransactions.result = .success(mockResponse)
        
        // when
        let captor = CompletionResultCaptor<[Transaction]>(testCase: self)
        sut.getTransactions(completion: captor.capture())
        let result = captor.waitAndGet()
        
        // then
        XCTAssertNil(captor.error())
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.count, mockResponse.count)
    }
}
