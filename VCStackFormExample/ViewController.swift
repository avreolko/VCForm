//
//  ViewController.swift
//  VCStackFormExample
//
//  Created by Valentin Cherepyanko on 31/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCStackForm
import VCFormBuilder

class ViewController: UIViewController {
	@IBOutlet weak var stackForm: VCStackForm!

	override func viewDidLoad() {
		super.viewDidLoad()
		self.fill()
	}
}

private extension ViewController {
	func fill() {
		var models: [FormElementModel] = []

		models.append((.padding, 20))
		models.append((.normalText, "Hello"))
		models.append((.padding, 20))
		models.append((.normalText, "Hello"))
		models.append((.padding, 20))
		models.append((.normalText, "Hello"))
		models.append((.padding, 20))
		models.append((.normalText, "Hello"))

		self.stackForm.fill(with: models)
	}
}

