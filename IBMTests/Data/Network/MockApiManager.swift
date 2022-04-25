//
//  MockApiManager.swift
//  IBMTests
//
//  Created by Carles Garcia Puigardeu on 25/4/22.
//

import Foundation
import XCTest

@testable import IBM

class MockApiManager: ApiManager {
    
    var getRates: ResultMethodStub<[RateResponseDTO]> = ResultMethodStub()
    var getTransactions: ResultMethodStub<[TransactionResponseDTO]> = ResultMethodStub()
    
    
    func getRates(completion: @escaping (Result<[RateResponseDTO], Error>) -> Void) {
        getRates.doCall()
        completion(getRates.result)
    }
    
    func getTransactions(completion: @escaping (Result<[TransactionResponseDTO], Error>) -> Void) {
        getTransactions.doCall()
        completion(getTransactions.result)
    }
}
