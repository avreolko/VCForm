//
//  IDynamicHeight.swift
//  VCStackForm
//
//  Created by Valentin Cherepyanko on 07/04/2019.
//  Copyright © 2019 Valentin Cherepyanko. All rights reserved.
//

public protocol IDynamicHeight: AnyObject {
	var heightChangedHandler: ((CGFloat) -> Void)? { get set }
}
