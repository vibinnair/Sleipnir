//
//  ActualValue.swift
//  Sleipnir
//
//  Created by Artur Termenji on 6/20/14.
//  Copyright (c) 2014 railsware. All rights reserved.
//

import Foundation

class ActualValue<T> {
    
    var value: T[] = T[]()
    
    var arrValue: T[]?

    init(value: T) {
        self.value.append(value)
    }
    
    init(arrValue: T[]) {
        self.arrValue = arrValue
    }
    
    func to(matcher: BaseMatcher<T>) {
        var result = match(matcher)
        if result {
            success()
        } else {
            fail(matcher)
        }
    }
    
    func fail(matcher: BaseMatcher<T>) {
        println(matcher.failureMessage())
    }
    
    func success() {
        println("SUCCESS")
    }
    
    func match(matcher: BaseMatcher<T>) -> Bool {
        if arrValue {
            return matcher.match(arrValue!)
        } else {
            return matcher.match(value[0])
        }
    }
}

func expect<T>(value: T) -> ActualValue<T> {
    return ActualValue(value: value)
}

func expect<T>(arrValue: T[]) -> ActualValue<T> {
    return ActualValue(arrValue: arrValue)
}