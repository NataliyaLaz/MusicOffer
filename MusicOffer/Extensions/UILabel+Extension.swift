//
//  UILabel+Extension.swift
//  MusicOffer
//
//  Created by Nataliya Lazouskaya on 2.07.22.
//

import UIKit

extension UILabel {
    
    convenience init(text: String) {
        self.init()
        
        self.text = text
        self.numberOfLines = 1
        self.textColor = .white
        self.font = .systemFont(ofSize: 15, weight: .bold)
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
