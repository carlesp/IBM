//
//  HomeViewModel.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

class HomeViewModel {
    
    private let getRatesUseCase: GetRatesUseCase
    private let getTransactionsUseCase: GetTransactionsUseCase
    
    private (set) var productsList: [Product] = []
    private var transactions: [Transaction] = []
    private (set) var rates: [Rate] = []
    
    init(getRatesUseCase: GetRatesUseCase,
         getTransactionsUseCase: GetTransactionsUseCase) {
        self.getRatesUseCase = getRatesUseCase
        self.getTransactionsUseCase = getTransactionsUseCase
    }
    
    public func getProductsList(completion: @escaping (Result<[Product], Error>) -> Void) {
        getRatesUseCase.execute(completion: { [weak self] result in
            switch result {
            case .success(let rates):
                self?.rates = rates
                self?.getTransactionsUseCase.execute(completion: { [weak self] result in
                    switch result {
                    case .success(let transactions):
                        self?.transactions = transactions
                        let products = self?.getProducts(from: transactions) ?? []
                        self?.productsList = products
                        completion(.success(products))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

extension HomeViewModel {
    private func getProducts(from transactions: [Transaction]) -> [Product] {
        var uniqueTransactions: [Transaction] = []
        for transaction in transactions {
            guard !uniqueTransactions.contains(where: { $0.sku == transaction.sku }) else { continue }
            uniqueTransactions.append(transaction)
        }
        
        let products: [Product] = uniqueTransactions.map({ (transaction) -> Product in
            Product(sky: transaction.sku,
                    transactions: transactions.filter( { $0.sku == transaction.sku }))
        })
        
        return products
    }
}
