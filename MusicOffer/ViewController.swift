//
//  ViewController.swift
//  MusicOffer
//
//  Created by Nataliya Lazouskaya on 29.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let leftView = LeftView()
    private let rightView = RightView()
    
    private var mainStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        rightView.activateButton.applyGradient(colors: [UIColor.specialBlue.cgColor, UIColor.specialPink.cgColor])
        rightView.activateButton.dropShadow()
        
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        mainStackView = UIStackView(arrangedSubviews: [leftView, rightView],
                                         axis: .horizontal,
                                         spacing: 0)
        mainStackView.distribution = .fillEqually
        view.addSubview(mainStackView)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}

