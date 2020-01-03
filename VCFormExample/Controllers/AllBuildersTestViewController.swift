//
//  AllBuildersTestViewController.swift
//  VCFormExample
//
//  Created by Valentin Cherepyanko on 04/01/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import VCForm
import UIKit

class AllBuildersTestViewController: UIViewController {

    @IBOutlet weak var form: VCForm!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillForm()
    }
}

private extension AllBuildersTestViewController {

    func fillForm() {

        self.form
            .add(LabelBuilder { $0.text = "This is just normal text. It uses multiline UILabel and expands with it contents. It's height also taken into account when UIScrollView tries to calculate content size." })
            .add(PaddingBuilder(height: 8))
            .add(LabelBuilder { $0.text = "First parameter in data is image itself, second one is the height of UIImageView. If you pass just '200', compiler will think that it's Int, not CGFloat. You should be careful about types of passed data. Or your view will not be configured." })
            .add(ImageViewBuilder(#imageLiteral(resourceName: "image.jpg"))) { $0.setConstraint(height: 200) }
            .add(LabelBuilder { $0.text = "Just a footer" }, to: .bottom)
            .add(DynamicHeightViewBuilder())
            .build()

    }
}
