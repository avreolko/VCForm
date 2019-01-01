//
//  AnotherViewController.swift
//  VCStackFormExample
//
//  Created by Valentin Cherepyanko on 31/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCStackForm

class AnotherViewController: UIViewController {
	@IBOutlet weak var stackView: UIStackView!

	private let formBuilder = StackViewFormBuilder()

    override func viewDidLoad() {
        super.viewDidLoad()


		self.formBuilder.append((.padding, 20))
		self.formBuilder.append((.normalText, "Hello"))
		self.formBuilder.append((.padding, 20))
		self.formBuilder.append((.normalText, "Hello"))
		self.formBuilder.append((.padding, 20))
		self.formBuilder.append((.normalText, "Hello"))
		self.formBuilder.append((.padding, 20))
		self.formBuilder.append((.normalText, "Hello"))
		self.formBuilder.build(in: self.stackView)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
