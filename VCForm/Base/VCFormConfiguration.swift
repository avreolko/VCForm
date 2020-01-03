//
//  VCFormConfiguration.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 03.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public class VCFormConfiguration {
    
    var showScrollIndicator: Bool
    var isScrollEnabled: Bool
    var contentInsets: UIEdgeInsets
    var heightAnimationDuration: Double
    
    public static var `default` =
        VCFormConfiguration(showScrollIndicator: true, isScrollEnabled: true)
    
    public init(showScrollIndicator: Bool = true,
                isScrollEnabled: Bool = true,
                contentInsets: UIEdgeInsets = .zero,
                heightAnimationDuration: Double = 0.3) {
        
        self.showScrollIndicator = showScrollIndicator
        self.isScrollEnabled = isScrollEnabled
        self.contentInsets = contentInsets
        self.heightAnimationDuration = heightAnimationDuration
    }
}
