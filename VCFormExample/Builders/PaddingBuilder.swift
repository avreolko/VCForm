//
//  PaddingBuilder.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 30/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCExtensions
import VCForm

struct PaddingBuilder {

    private let height: CGFloat

    init(height: CGFloat) {
        self.height = height
    }
}

extension PaddingBuilder: IViewBuilder {

    typealias View = UIView

    func buildView() -> View {
        let view = UIView(frame: .zero)
        view.setConstraint(height: self.height)
        return view
    }
}
