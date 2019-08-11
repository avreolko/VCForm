//
//  ViewController.swift
//  VCStackFormExample
//
//  Created by Valentin Cherepyanko on 31/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCStackForm

class ScrollTestViewController: UIViewController {
	
	@IBOutlet weak var stackForm: VCStackForm!

	private let buildersProvider = BuildersProvider()

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
		self.stackForm.buildersProvider = self.buildersProvider
	}

	func fillForm() {
		var elements: [DefaultFormElementType] = []

		elements.append(.image(#imageLiteral(resourceName: "pasternak"), 200))
		elements.append(.padding(20))
		elements.append(.title("Пастернак Б.Л."))
		elements.append(.title("1956"))
		elements.append(.padding(20))
		elements.append(.normalText("""
		Быть знаменитым некрасиво.
		Не это подымает ввысь.
		Не надо заводить архива,
		Над рукописями трястись.
		"""))
		elements.append(.padding(20))
		elements.append(.normalText("""
		Цель творчества - самоотдача,
		А не шумиха, не успех.
		Позорно, ничего не знача,
		Быть притчей на устах у всех.
		"""))
		elements.append(.padding(20))
		elements.append(.normalText("""
		Но надо жить без самозванства,
		Так жить, чтобы в конце концов
		Привлечь к себе любовь пространства,
		Услышать будущего зов.
		"""))
		elements.append(.padding(20))
		elements.append(.normalText("""
		И надо оставлять пробелы
		В судьбе, а не среди бумаг,
		Места и главы жизни целой
		Отчеркивая на полях.
		"""))
		elements.append(.padding(20))
		elements.append(.normalText("""
		И окунаться в неизвестность,
		И прятать в ней свои шаги,
		Как прячется в тумане местность,
		Когда в ней не видать ни зги.
		"""))
		elements.append(.padding(20))
		elements.append(.normalText("""
		Другие по живому следу
		Пройдут твой путь за пядью пядь,
		Но пораженья от победы
		Ты сам не должен отличать.
		"""))
		elements.append(.padding(20))
		elements.append(.normalText("""
		И должен ни единой долькой
		Не отступаться от лица,
		Но быть живым, живым и только,
		Живым и только до конца.
		"""))

		self.stackForm.fill(with: elements)
	}
}

