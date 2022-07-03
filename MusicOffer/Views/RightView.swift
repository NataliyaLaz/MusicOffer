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
        label.text = "LAST MINUTE CHANCE!\n to claim your offer"
        label.numberOfLines = 2
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "90% OFF"
        label.numberOfLines = 1
        label.textColor = .white
        label.font = .systemFont(ofSize: 55, weight: .black)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let forLabel: UILabel = {
        let label = UILabel()
        label.text = "For true music fans"
        label.numberOfLines = 1
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    private let daysView = TimerView()
    private let hoursView = TimerView()
    private let minutesView = TimerView()
    private let secondsView = TimerView()
    
    private let colonLabel1 = UILabel(text: ":")
    private let colonLabel2 = UILabel(text: ":")
    private let colonLabel3 = UILabel(text: ":")

    private var timerStackView = UIStackView()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Hundreds of songs in your pocket"
        label.numberOfLines = 1
        label.textColor = .systemGray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
      var activateButton: UIButton = {

        let button = UIButton(type: .system)
        button.setTitle("ACTIVATE OFFER", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        button.tintColor = .white
        button.layer.cornerRadius = 12
        button.translatesAutoresizingMaskIntoConstraints = false
         button.addTarget(RightView.self, action: #selector(activateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var privacyButton = UIButton(text: "Privacy")
    private lazy var restoreButton = UIButton(text: "Restore")
    private lazy var termsButton = UIButton(text: "Terms")
    
    private var privacyStackView = UIStackView()
    
    override init(frame: CGRect){
        super.init(frame:frame)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func activateButtonTapped() {
        print("activateButtonTapped")
    }
    
    private func setupViews() {
        backgroundColor = .black
        addSubview(newWorkoutLabel)
        addSubview(percentageLabel)
        addSubview(forLabel)
        timerStackView = UIStackView(arrangedSubviews: [daysView,colonLabel1,hoursView, colonLabel2,minutesView,colonLabel3,secondsView], axis: .horizontal, spacing: 5)
        addSubview(timerStackView)
        addSubview(descriptionLabel)
        addSubview(activateButton)
        
        privacyStackView = UIStackView(arrangedSubviews: [privacyButton, restoreButton, termsButton], axis: .horizontal, spacing: 20)
        addSubview(privacyStackView)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            percentageLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 12),
            percentageLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            forLabel.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor, constant: 8),
            forLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            timerStackView.topAnchor.constraint(equalTo: forLabel.bottomAnchor, constant: 20),
            timerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            timerStackView.heightAnchor.constraint(equalToConstant: 41),
          //  timerStackView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: 16),
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            activateButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            activateButton.heightAnchor.constraint(equalToConstant: 63),
            activateButton.widthAnchor.constraint(equalToConstant: 300),
            activateButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            privacyStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            privacyStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
          //  timerStackView.heightAnchor.constraint(equalToConstant: 41),
          //  timerStackView.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.8)
        ])
    }
}
