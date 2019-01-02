//
//  ActionButton.swift
//  PUB
//
//  Created by Valentin Cherepyanko on 11/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public class ActionButton: UIButton {
	
	var tapHandler: (() -> Void)?

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.setup()
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)

		self.setup()
	}

	func setup() {
		self.addAction()
	}
}

private extension ActionButton {

	func addAction() {
		self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
	}

	@objc func tapped() {
		self.tapHandler?()
	}
}
