//
//  TransactionsRepository.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

public protocol TransactionsRepository {
    func getTransactions(completion: @escaping (Result<[Transaction], Error>) -> Void)
}
