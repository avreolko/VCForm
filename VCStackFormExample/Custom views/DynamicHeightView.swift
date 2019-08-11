//
//  DynamicHeightView.swift
//  VCStackForm
//
//  Created by Valentin Cherepyanko on 07/04/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCStackForm

public class DynamicHeightView: UIView, IDynamicHeight {
	@IBOutlet weak var height: NSLayoutConstraint!
	@IBOutlet weak var button: ActionButton!

	public var collapsedHeight: CGFloat = 0
	public var expandedHeight: CGFloat = 0

	public var heightChangedHandler: ((CGFloat) -> Void)?

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
			self.heightChangedHandler?(height)
		}
	}
}
