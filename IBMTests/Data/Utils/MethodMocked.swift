//
//  MethodMocked.swift
//  IBMTests
//
//  Created by Carles Garcia Puigardeu on 25/4/22.
//

import Foundation

struct UnStubError: Swift.Error {
    var description: String {
        return "UnStubd object."
    }
}

final class MethodStub<T> {
    var called = false
    var result: T? = .none
    var params: [Any] = []
    
    func doCall(params: [Any] = []) {
        self.called = true
        self.params = params
    }
}

final class ResultMethodStub<T> {
    var called = false
    var result: Result<T, Error> = .failure(UnStubError())
    var params: [Any] = []
    
    func doCall(params: [Any] = []) {
        self.called = true
        self.params = params
    }
}
