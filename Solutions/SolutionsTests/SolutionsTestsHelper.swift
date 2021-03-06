//
//  SolutionsTestsHelper.swift
//  Solutions
//
//  Created by Wu, Di on 3/30/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

let Default_Timeout_Value = 0.01
let Default_Timeout_Suffix: String = " Time Out"

func assertHelper(_ expression: @autoclosure () -> Boolean, problemName: String , input: Any, resultValue: Any, expectedValue: Any) {
    XCTAssert(expression(), "\n====================================\nProblem: \(problemName)\n====================================\nInput: \"\(input)\"\n====================================\nExpected: \"\(expectedValue)\"\n====================================\nResult: \"\(resultValue)\"\n====================================\n")
}
