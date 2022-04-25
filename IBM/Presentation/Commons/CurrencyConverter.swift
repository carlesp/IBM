//
//  CurrencyConverter.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

class CurrencyConverter {
    
    private let rates: [Rate]
    
    init(rates: [Rate]) {
        self.rates = rates
    }
    
    func convert(amount: Decimal, fromCurrency: String, toCurrency: String) -> Decimal? {
        guard fromCurrency != toCurrency else { return amount }
        
        if let rate = rates.first(where: { $0.from == fromCurrency && $0.to == toCurrency }) {
            return (amount * rate.rate).rounded(2, .bankers)
        } else {
            let availableRates = rates.filter({ $0.from == fromCurrency })
            for availableRate in availableRates {
                if let secondRate = rates.first(where: { $0.from == availableRate.from && $0.to == toCurrency }) {
                    return (amount * availableRate.rate * secondRate.rate).rounded(2, .bankers)
                }
            }
            return nil
        }
    }
}
