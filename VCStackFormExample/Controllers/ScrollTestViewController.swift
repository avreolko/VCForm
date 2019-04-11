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

class ScrollTestViewController: UIViewController {
	
	@IBOutlet weak var stackForm: VCStackForm!

	override func viewDidLoad() {
		super.viewDidLoad()
		self.configureForm()
		self.fillForm()
	}
}

private extension ScrollTestViewController {

	func configureForm() {
		let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
		let config = VCStackFormConfiguration(showScrollIndicator: false, contentInsets: insets)
		self.stackForm.configure(with: config)
	}

	func fillForm() {
		var models: [FormElementModel] = []

		models.append((DefaultFormElementType.image, (#imageLiteral(resourceName: "pasternak"), CGFloat(200))))
		models.append((DefaultFormElementType.padding, 30))
		models.append((DefaultFormElementType.title, "Пастернак Б.Л."))
		models.append((DefaultFormElementType.title, "1956"))
		models.append((DefaultFormElementType.padding, 20))
		models.append((DefaultFormElementType.normalText, """
		Быть знаменитым некрасиво.
		Не это подымает ввысь.
		Не надо заводить архива,
		Над рукописями трястись.
		"""))
		models.append((DefaultFormElementType.padding, 20))
		models.append((DefaultFormElementType.normalText, """
		Цель творчества - самоотдача,
		А не шумиха, не успех.
		Позорно, ничего не знача,
		Быть притчей на устах у всех.
		"""))
		models.append((DefaultFormElementType.padding, 20))
		models.append((DefaultFormElementType.normalText, """
		Но надо жить без самозванства,
		Так жить, чтобы в конце концов
		Привлечь к себе любовь пространства,
		Услышать будущего зов.
		"""))
		models.append((DefaultFormElementType.padding, 20))
		models.append((DefaultFormElementType.normalText, """
		И надо оставлять пробелы
		В судьбе, а не среди бумаг,
		Места и главы жизни целой
		Отчеркивая на полях.
		"""))
		models.append((DefaultFormElementType.padding, 20))
		models.append((DefaultFormElementType.normalText, """
		И окунаться в неизвестность,
		И прятать в ней свои шаги,
		Как прячется в тумане местность,
		Когда в ней не видать ни зги.
		"""))
		models.append((DefaultFormElementType.padding, 20))
		models.append((DefaultFormElementType.normalText, """
		Другие по живому следу
		Пройдут твой путь за пядью пядь,
		Но пораженья от победы
		Ты сам не должен отличать.
		"""))
		models.append((DefaultFormElementType.padding, 20))
		models.append((DefaultFormElementType.normalText, """
		И должен ни единой долькой
		Не отступаться от лица,
		Но быть живым, живым и только,
		Живым и только до конца.
		"""))

		self.stackForm.fill(with: models)
	}
}

