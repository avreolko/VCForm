//
//  DynamicHeightView.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 07/04/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCForm

public class DynamicHeightView: UIView {
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var button: ActionButton!

    private let collapsedHeight: CGFloat = 40
    private let expandedHeight: CGFloat = 100

    override public func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
}

private extension DynamicHeightView {

    func setup() {
        var expanded: Bool = false

        self.button.tapHandler = { [weak self] in
            guard let self = self else {
                return
            }

            expanded = !expanded
            let height: CGFloat = expanded ? self.expandedHeight : self.collapsedHeight
            self.height.constant = height
        }
    }
}
