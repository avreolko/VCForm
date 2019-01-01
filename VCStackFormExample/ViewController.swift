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

		DispatchQueue.main.asyncAfter(deadline: .now()) {
			self.fill()
		}
	}
}

private extension ViewController {
	func fill() {
		var models: [FormElementModel] = []

		models.append((.padding, 20))
		models.append((.normalText, """
			Быть знаменитым некрасиво.
			Не это подымает ввысь.
			Не надо заводить архива,
			Над рукописями трястись.
		"""))
		models.append((.padding, 20))
		models.append((.normalText, """
			Цель творчества - самоотдача,
			А не шумиха, не успех.
			Позорно, ничего не знача,
			Быть притчей на устах у всех.
		"""))
		models.append((.padding, 20))
		models.append((.normalText, """
			Но надо жить без самозванства,
			Так жить, чтобы в конце концов
			Привлечь к себе любовь пространства,
			Услышать будущего зов.
		"""))
		models.append((.padding, 20))
		models.append((.normalText, """
			И надо оставлять пробелы
			В судьбе, а не среди бумаг,
			Места и главы жизни целой
			Отчеркивая на полях.
		"""))
		models.append((.padding, 20))
		models.append((.normalText, """
			И окунаться в неизвестность,
			И прятать в ней свои шаги,
			Как прячется в тумане местность,
			Когда в ней не видать ни зги.
		"""))
		models.append((.padding, 20))
		models.append((.normalText, """
			Другие по живому следу
			Пройдут твой путь за пядью пядь,
			Но пораженья от победы
			Ты сам не должен отличать.
		"""))
		models.append((.padding, 20))
		models.append((.normalText, """
			И должен ни единой долькой
			Не отступаться от лица,
			Но быть живым, живым и только,
			Живым и только до конца.
		"""))
		models.append((.padding, 20))

		self.stackForm.fill(with: models)
	}
}

