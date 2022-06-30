//
//  ViewController.swift
//  MusicOffer
//
//  Created by Nataliya Lazouskaya on 29.06.22.
//

import UIKit

class ViewController: UIViewController {
    
    private let leftView = LeftView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(leftView)
    }
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            leftView.topAnchor.constraint(equalTo: view.topAnchor),
            leftView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            leftView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leftView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
}

