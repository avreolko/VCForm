//
//  VCFormConfiguration.swift
//  VCForm
//
//  Created by Valentin Cherepyanko on 21/04/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit

public struct VCFormConfiguration {

	let showScrollIndicator: Bool
	let isScrollEnabled: Bool
	let contentInsets: UIEdgeInsets

	let alignment: UIStackView.Alignment
	let distribution: UIStackView.Distribution

	let heightAnimationDuration: Double

	public static var `default` =
		VCFormConfiguration(showScrollIndicator: true, isScrollEnabled: true)

	public init(showScrollIndicator: Bool = true,
				isScrollEnabled: Bool = true,
				contentInsets: UIEdgeInsets = .zero,
				alignment: UIStackView.Alignment = .fill,
				distribution: UIStackView.Distribution = .fill,
				heightAnimationDuration: Double = 0.3) {

		self.showScrollIndicator = showScrollIndicator
		self.isScrollEnabled = isScrollEnabled
		self.contentInsets = contentInsets
		self.alignment = alignment
		self.distribution = distribution
		self.heightAnimationDuration = heightAnimationDuration
	}
}
