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
		self.fill()
	}
}

private extension ScrollTestViewController {
	func fill() {
		var models: [FormElementModel] = []

		models.append((FormElementType.image, (#imageLiteral(resourceName: "pasternak"), CGFloat(200))))
		models.append((FormElementType.padding, 30))
		models.append((FormElementType.title, "\tПастернак Б.Л."))
		models.append((FormElementType.title, "\t1956"))
		models.append((FormElementType.padding, 20))
		models.append((FormElementType.normalText, """
			Быть знаменитым некрасиво.
			Не это подымает ввысь.
			Не надо заводить архива,
			Над рукописями трястись.
		"""))
		models.append((FormElementType.padding, 20))
		models.append((FormElementType.normalText, """
			Цель творчества - самоотдача,
			А не шумиха, не успех.
			Позорно, ничего не знача,
			Быть притчей на устах у всех.
		"""))
		models.append((FormElementType.padding, 20))
		models.append((FormElementType.normalText, """
			Но надо жить без самозванства,
			Так жить, чтобы в конце концов
			Привлечь к себе любовь пространства,
			Услышать будущего зов.
		"""))
		models.append((FormElementType.padding, 20))
		models.append((FormElementType.normalText, """
			И надо оставлять пробелы
			В судьбе, а не среди бумаг,
			Места и главы жизни целой
			Отчеркивая на полях.
		"""))
		models.append((FormElementType.padding, 20))
		models.append((FormElementType.normalText, """
			И окунаться в неизвестность,
			И прятать в ней свои шаги,
			Как прячется в тумане местность,
			Когда в ней не видать ни зги.
		"""))
		models.append((FormElementType.padding, 20))
		models.append((FormElementType.normalText, """
			Другие по живому следу
			Пройдут твой путь за пядью пядь,
			Но пораженья от победы
			Ты сам не должен отличать.
		"""))
		models.append((FormElementType.padding, 20))
		models.append((FormElementType.normalText, """
			И должен ни единой долькой
			Не отступаться от лица,
			Но быть живым, живым и только,
			Живым и только до конца.
		"""))
		models.append((FormElementType.padding, 20))

		self.stackForm.fill(with: models)
	}
}

