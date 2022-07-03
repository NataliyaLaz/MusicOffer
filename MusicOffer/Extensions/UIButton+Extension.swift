//
//  UIButton+Extension.swift
//  MusicOffer
//
//  Created by Nataliya Lazouskaya on 2.07.22.
//

import UIKit

extension UIButton {
    
    convenience init(text: String) {
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        self.tintColor = .systemGray2
        self.titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func applyGradient(colors: [CGColor]){
        
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = colors
            gradientLayer.frame = self.bounds
            gradientLayer.cornerRadius = 12
                       gradientLayer.masksToBounds = false
        self.layer.insertSublayer(gradientLayer, at: 0)
//
        }
    
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.specialPink.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = .zero
        layer.shadowRadius = 20
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
}

