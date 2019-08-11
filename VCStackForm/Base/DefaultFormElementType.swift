//
//  DefaultFormElementType.swift
//  VCStackForm
//
//  Created by Valentin Cherepyanko on 03/01/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

import UIKit
import CoreGraphics

public enum DefaultFormElementType {
	case normalText(String)
	case image(UIImage, CGFloat)
	case button(String, () -> Void)
	case field(() -> Void)
	case padding(CGFloat)
	case title(String)
	case dynamicHeight(CGFloat, CGFloat)
}

extension DefaultFormElementType: IFormElementType {

	public var id: String {
		switch self {
		case .normalText: return "normalText"
		case .image: return "image"
		case .button: return "button"
		case .field: return "field"
		case .padding: return "padding"
		case .title: return "title"
		case .dynamicHeight: return "normalText"
		}
	}
}
