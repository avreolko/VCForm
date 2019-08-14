//
//  ViewController.swift
//  VCFormExample
//
//  Created by Valentin Cherepyanko on 31/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCForm

class ScrollTestViewController: UIViewController {
	
	@IBOutlet weak var form: VCForm!

	override func viewDidLoad() {
		super.viewDidLoad()
		self.configureForm()
		self.fillForm()
	}
}

private extension ScrollTestViewController {

	func configureForm() {
		let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
		let config = VCFormConfiguration(showScrollIndicator: false, contentInsets: insets)
		self.form.configure(with: config)
	}

	func fillForm() {
//		var elements: [DefaultFormElement] = []
//
//		elements.append(.image(#imageLiteral(resourceName: "pasternak.jpg")))
//		elements.append(.padding)
//		elements.append(.title("Пастернак Б.Л."))
//		elements.append(.title("1956"))
//		elements.append(.padding)
//		elements.append(.normalText("""
//		Быть знаменитым некрасиво.
//		Не это подымает ввысь.
//		Не надо заводить архива,
//		Над рукописями трястись.
//		"""))
//		elements.append(.padding)
//		elements.append(.normalText("""
//		Цель творчества - самоотдача,
//		А не шумиха, не успех.
//		Позорно, ничего не знача,
//		Быть притчей на устах у всех.
//		"""))
//		elements.append(.padding)
//		elements.append(.normalText("""
//		Но надо жить без самозванства,
//		Так жить, чтобы в конце концов
//		Привлечь к себе любовь пространства,
//		Услышать будущего зов.
//		"""))
//		elements.append(.padding)
//		elements.append(.normalText("""
//		И надо оставлять пробелы
//		В судьбе, а не среди бумаг,
//		Места и главы жизни целой
//		Отчеркивая на полях.
//		"""))
//		elements.append(.padding)
//		elements.append(.normalText("""
//		И окунаться в неизвестность,
//		И прятать в ней свои шаги,
//		Как прячется в тумане местность,
//		Когда в ней не видать ни зги.
//		"""))
//		elements.append(.padding)
//		elements.append(.normalText("""
//		Другие по живому следу
//		Пройдут твой путь за пядью пядь,
//		Но пораженья от победы
//		Ты сам не должен отличать.
//		"""))
//		elements.append(.padding)
//		elements.append(.normalText("""
//		И должен ни единой долькой
//		Не отступаться от лица,
//		Но быть живым, живым и только,
//		Живым и только до конца.
//		"""))
//
//		self.form.fill(with: elements)
	}
}
