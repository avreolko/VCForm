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
		let insets = UIEdgeInsets(top: 50, left: 20, bottom: 50, right: 20)
		let config = VCFormConfiguration(showScrollIndicator: false, contentInsets: insets)
		self.form.configure(with: config)
	}

	func fillForm() {

		self.form
			.add(ImageViewBuilder(viewConfiguration: .init(image: #imageLiteral(resourceName: "pasternak.jpg"), height: 200)))
			.add(PaddingBuilder(viewConfiguration: .init(height: 8)))
			.add(TitleBuilder(viewConfiguration: .init(text: "Пастернак Б.Л.")))
			.add(TitleBuilder(viewConfiguration: .init(text: "1956")))
			.add(PaddingBuilder(viewConfiguration: .init(height: 8)))
			.add(LabelBuilder(viewConfiguration: .init(text: """
			Быть знаменитым некрасиво.
			Не это подымает ввысь.
			Не надо заводить архива,
			Над рукописями трястись.
			""")))
			.add(PaddingBuilder(viewConfiguration: .init(height: 8)))
			.add(LabelBuilder(viewConfiguration: .init(text: """
			Цель творчества - самоотдача,
			А не шумиха, не успех.
			Позорно, ничего не знача,
			Быть притчей на устах у всех.
			""")))
			.add(PaddingBuilder(viewConfiguration: .init(height: 8)))
			.add(LabelBuilder(viewConfiguration: .init(text: """
			Но надо жить без самозванства,
			Так жить, чтобы в конце концов
			Привлечь к себе любовь пространства,
			Услышать будущего зов.
			""")))
			.add(PaddingBuilder(viewConfiguration: .init(height: 8)))
			.add(LabelBuilder(viewConfiguration: .init(text: """
			И надо оставлять пробелы
			В судьбе, а не среди бумаг,
			Места и главы жизни целой
			Отчеркивая на полях.
			""")))
			.add(PaddingBuilder(viewConfiguration: .init(height: 8)))
			.add(LabelBuilder(viewConfiguration: .init(text: """
			И окунаться в неизвестность,
			И прятать в ней свои шаги,
			Как прячется в тумане местность,
			Когда в ней не видать ни зги.
			""")))
			.add(PaddingBuilder(viewConfiguration: .init(height: 8)))
			.add(LabelBuilder(viewConfiguration: .init(text: """
			Другие по живому следу
			Пройдут твой путь за пядью пядь,
			Но пораженья от победы
			Ты сам не должен отличать.
			""")))
			.add(PaddingBuilder(viewConfiguration: .init(height: 8)))
			.add(LabelBuilder(viewConfiguration: .init(text: """
			И должен ни единой долькой
			Не отступаться от лица,
			Но быть живым, живым и только,
			Живым и только до конца.
			""")))
			.build()
	}
}

