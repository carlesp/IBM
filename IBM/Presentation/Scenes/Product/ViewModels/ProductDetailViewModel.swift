//
//  ProductDetailViewModel.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

class ProductDetailViewModel {
    
    public func getTotalAmount(product: Product, rates: [Rate]) -> String? {
        guard let transactions = product.transactions else { return nil }
        let currencyConverter = CurrencyConverter(rates: rates)
        
        let transactionsEUR: [Decimal] = transactions.compactMap({ transaction in
            guard let amount = currencyConverter.convert(amount: transaction.amount, fromCurrency: transaction.currency, toCurrency: "EUR") else { return nil }
            return amount
        })
        

        return "\(transactionsEUR.reduce(0, +)) EUR"
    }
}
