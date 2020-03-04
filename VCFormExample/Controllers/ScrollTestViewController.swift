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

        self.form.configuration = VCFormConfiguration(spacing: 16, reorderable: true)

        self.fillForm()
    }
}

private extension ScrollTestViewController {

    func fillForm() {

        self.form
            .add(ImageViewBuilder(#imageLiteral(resourceName: "pasternak.jpg"))) { $0.setConstraint(height: 200) }
            .add(LabelBuilder { $0.text = """
                Быть знаменитым некрасиво.
                Не это подымает ввысь.
                Не надо заводить архива,
                Над рукописями трястись.
                """})
            .add(LabelBuilder { $0.text = """
                Цель творчества - самоотдача,
                А не шумиха, не успех.
                Позорно, ничего не знача,
                Быть притчей на устах у всех.
                """})
            .add(LabelBuilder { $0.text = """
                Но надо жить без самозванства,
                Так жить, чтобы в конце концов
                Привлечь к себе любовь пространства,
                Услышать будущего зов.
                """})
            .add(LabelBuilder { $0.text = """
                И надо оставлять пробелы
                В судьбе, а не среди бумаг,
                Места и главы жизни целой
                Отчеркивая на полях.
                """})
            .add(LabelBuilder { $0.text = """
                И окунаться в неизвестность,
                И прятать в ней свои шаги,
                Как прячется в тумане местность,
                Когда в ней не видать ни зги.
                """})
            .add(LabelBuilder { $0.text = """
                Другие по живому следу
                Пройдут твой путь за пядью пядь,
                Но пораженья от победы
                Ты сам не должен отличать.
                """})
            .add(LabelBuilder { $0.text = """
                И должен ни единой долькой
                Не отступаться от лица,
                Но быть живым, живым и только,
                Живым и только до конца.
                """})
            .build()
    }
}

