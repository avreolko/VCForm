//
//  ActionTextField.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public class ActionTextField: UITextField {

	var changeDelay = 0.5
	var changeHandler: (() -> Void)?

	private var timer: Timer?

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

private extension ActionTextField {

	func addAction() {
		self.addTarget(self, action: #selector(changed), for: .editingChanged)
	}

	@objc func changed() {
		self.timer?.invalidate()
		self.timer = Timer.scheduledTimer(withTimeInterval: self.changeDelay,
										  repeats: false,
										  block: { [weak self] (timer) in
			self?.changeHandler?()
		})
	}
}
