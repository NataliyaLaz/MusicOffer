//
//  UIStackView+Extension.swift
//  MusicOffer
//
//  Created by Nataliya Lazouskaya on 30.06.22.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews:arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = .fill
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
