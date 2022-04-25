//
//  ModelMapper.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

public struct RateMapper: Mapper {
    static public func map(input: [RateResponseDTO]) -> [Rate] {
        return input.map { countK -> Rate in
            Rate(from: countK.from, to: countK.to, rate: Decimal(string: countK.rate)!)
        }
    }
}

public struct TrasactionMapper: Mapper {
    static public func map(input: [TransactionResponseDTO]) -> [Transaction] {
        return input.map { countK -> Transaction in
            Transaction(sku: countK.sku, amount: Decimal(string: countK.amount)!, currency: countK.currency)
        }
    }
}
