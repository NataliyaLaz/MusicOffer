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
        label.backgroundColor = .cyan
        label.text = "LAST MINUTE CHANCE!\n to claim your offer"
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .robotoSemibold22()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect){
        super.init(frame:frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .purple
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(newWorkoutLabel)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
    }
    
}
