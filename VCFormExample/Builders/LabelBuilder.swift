//
//  UILabelModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCForm

struct LabelBuilder {

    private let viewHandler: ((UILabel) -> Void)?

    init(viewHandler: ((UILabel) -> Void)? = nil) {
        self.viewHandler = viewHandler
    }
}

extension LabelBuilder: IViewBuilder {

    typealias View = UILabel

    func buildView() -> View {
        let label = UILabel(frame: .zero)

        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0

        self.viewHandler?(label)
        return label
    }
}

