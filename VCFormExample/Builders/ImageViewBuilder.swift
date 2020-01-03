//
//  ImageModel.swift
//  VCFormBuilder
//
//  Created by Valentin Cherepyanko on 29/12/2018.
//  Copyright © 2018 Valentin Cherepyanko. All rights reserved.
//

import VCExtensions
import VCForm
import UIKit

struct ImageViewBuilder {

    private let image: UIImage

    init(_ image: UIImage) {
        self.image = image
    }
}

extension ImageViewBuilder: IViewBuilder {

    typealias View = UIImageView

    func buildView() -> UIImageView {
        let imageView = UIImageView(frame: .zero)
        imageView.image = self.image
        return imageView
    }
}
