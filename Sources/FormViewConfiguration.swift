//
//  FormViewConfiguration.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 03.01.2020.
//  Copyright © 2020 Valentin Cherepyanko. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

struct FormViewConfiguration {
    
    var showScrollIndicator: Bool
    var isScrollEnabled: Bool
    var heightAnimationDuration: Double
    var spacing: CGFloat
    var reorderable: [FormSection: Bool]
    
    public init(showScrollIndicator: Bool = true,
                isScrollEnabled: Bool = true,
                heightAnimationDuration: Double = 0.3,
                spacing: CGFloat = 0,
                reorderable: [FormSection: Bool] = [:]) {
        
        self.showScrollIndicator = showScrollIndicator
        self.isScrollEnabled = isScrollEnabled
        self.heightAnimationDuration = heightAnimationDuration
        self.spacing = spacing
        self.reorderable = reorderable
    }
}
