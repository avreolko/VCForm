//
//  DefaultFormElementType.swift
//  VCStackForm
//
//  Created by Valentin Cherepyanko on 03/01/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

public enum DefaultFormElementType: String {
	case normalText
	case image
	case button
	case field
	case padding
	case title
	case dynamicHeight
}

extension DefaultFormElementType: IFormElementType {

	public var id: String {
		return self.rawValue
	}
}
