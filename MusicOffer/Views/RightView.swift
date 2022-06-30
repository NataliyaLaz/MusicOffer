//
//  RightView.swift
//  MusicOffer
//
//  Created by Nataliya Lazouskaya on 30.06.22.
//

import UIKit

class RightView:UIView {
    
    private let newWorkoutLabel: UILabel = {
        let label = UILabel()
        label.text = "LAST MINUTE CHANCE!\n to clai your offer"
        label.textColor = .white
        //label.font = UIFont(name: <#T##String#>, size: <#T##CGFloat#>)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
}
