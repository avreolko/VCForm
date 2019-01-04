//
//  FormElementType.swift
//  VCStackForm
//
//  Created by Valentin Cherepyanko on 03/01/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import VCFormBuilder

public enum FormElementType: String {
	case normalText
	case image
	case button
	case field
	case padding
	case title
}

extension FormElementType: IBuilderType {
	public var stringID: String {
		return self.rawValue
	}
}
