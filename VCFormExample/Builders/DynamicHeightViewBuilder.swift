//
//  DynamicHeightViewBuilder.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 07/04/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCForm
import VCExtensions

struct DynamicHeightViewBuilder: IViewBuilder {

    typealias View = DynamicHeightView

    func buildView() -> View {
        return DynamicHeightView.loadFromXib()!
    }
}

