//
//  Medium_022_Generate_Parentheses_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/5/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_022_Generate_Parentheses_Test: XCTestCase {
    private static let ProblemName: String = "Medium_022_Generate_Parentheses"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value

    func test_001() {
        let input: Int = 1
        let expected: [String] = ["()"]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: Int = 0
        let expected: [String] = [""]
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: Int = 3
        let expected: [String] = ["((()))", "(()())", "(())()", "()(())", "()()()"]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input: Int, expected: [String]) {
        weak var expectation: XCTestExpectation? = self.expectation(withDescription: Medium_022_Generate_Parentheses_Test.TimeOutName)
        DispatchQueue.global(attributes: DispatchQueue.GlobalAttributes.qosDefault).async(execute: { () -> Void in
            let result: [String] = Medium_022_Generate_Parentheses.generateParenthesis(input)
            assertHelper(Set(expected) == Set(result), problemName: Medium_022_Generate_Parentheses_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectations(withTimeout: Medium_022_Generate_Parentheses_Test.TimeOut) { (error: NSError?) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_022_Generate_Parentheses_Test.ProblemName, input: input, resultValue: Medium_022_Generate_Parentheses_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
