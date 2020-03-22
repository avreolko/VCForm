//
//  VCFormConfiguration.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 03.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//

import UIKit

struct VCFormConfiguration {
    
    var showScrollIndicator: Bool
    var isScrollEnabled: Bool
    var heightAnimationDuration: Double
    var spacing: CGFloat
    var reorderable: [FormPosition: Bool]
    
    public init(showScrollIndicator: Bool = true,
                isScrollEnabled: Bool = true,
                heightAnimationDuration: Double = 0.3,
                spacing: CGFloat = 0,
                reorderable: [FormPosition: Bool] = [:]) {
        
        self.showScrollIndicator = showScrollIndicator
        self.isScrollEnabled = isScrollEnabled
        self.heightAnimationDuration = heightAnimationDuration
        self.spacing = spacing
        self.reorderable = reorderable
    }
}
