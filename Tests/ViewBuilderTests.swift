//
//  ViewBuilderTests.swift
//  
//
//  Created by Valentin Cherepyanko on 30.04.2021.
//

import XCTest
@testable import VCForm

final class View: UIView { }

final class ViewBuilderTests: XCTestCase {

    func test_code_builder() {

        var handledView: UIView?

        let exp = expectation(description: "handler call")

        let builder = ProgrammaticBuilder<UILabel>(
            viewHandler: { view in
                handledView = view
                exp.fulfill()
            }
        )

        XCTAssertTrue(builder.buildView() === handledView)
        waitForExpectations(timeout: 0.1)
    }
}
