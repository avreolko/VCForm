//
//  AllBuildersTestViewController.swift
//  VCStackFormExample
//
//  Created by Valentin Cherepyanko on 04/01/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCStackForm
import VCFormBuilder

class AllBuildersTestViewController: UIViewController {

	@IBOutlet weak var stackForm: VCStackForm!
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.configureForm()
		self.fillForm()
	}
}

private extension AllBuildersTestViewController {

	func configureForm() {
		let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
		let config = VCStackFormConfiguration(showScrollIndicator: false, contentInsets: insets)
		self.stackForm.configure(with: config)
	}

	func fillForm() {
		var models: [FormElementModel] = []

		let buttonData = ("Button", {
			print("Button tapped")
		})

		let fieldData = {
			print("Text field changed value")
		}

		models.append((FormElementType.title, "Normal text test"))
		models.append((FormElementType.normalText, "This is just normal text. It uses multiline UILabel and expands with it contents. It's height also taken into account when UIScrollView tries to calculate content size."))


		models.append((FormElementType.padding, 20))
		models.append((FormElementType.title, "Button test"))
		models.append((FormElementType.normalText, "For button was written custom class with possibility to assign tap handler, that executes every time when button is tapped. Try to tap on it and see in console for some events."))
		models.append((FormElementType.button, buttonData))


		models.append((FormElementType.padding, 20))
		models.append((FormElementType.title, "Text field test"))
		models.append((FormElementType.normalText, "Same as button, it uses custom class with change handler."))
		models.append((FormElementType.field, fieldData))

		models.append((FormElementType.padding, 20))
		models.append((FormElementType.title, "Image test"))
		models.append((FormElementType.normalText, "First parameter in data is image itself, second one is the height of UIImageView. If you pass just '200', compiler will think that it's Int, not CGFloat. You should be careful about types of passed data. Or your view will not be configured."))
		models.append((FormElementType.image, (#imageLiteral(resourceName: "image"), CGFloat(200))))

		self.stackForm.fill(with: models)
	}
}
