//
//  RightView.swift
//  MusicOffer
//
//  Created by Nataliya Lazouskaya on 30.06.22.
//

import UIKit

class RightView:UIView {
    
    class Device {
        static var isIpad : Bool { return UIDevice.current.userInterfaceIdiom == .pad }
    }
    
    let screenWidth = UIScreen.main.bounds.size.height
    
    private let chanceLabel: UILabel = {
        let label = UILabel()
        label.text = "LAST MINUTE CHANCE!\n to claim your offer"
        label.numberOfLines = 2
        label.textColor = .white
        if Device.isIpad {
            label.font = .systemFont(ofSize: 35, weight: .semibold)
        } else {
            label.font = .systemFont(ofSize: 22, weight: .semibold)
        }
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "90% OFF"
        label.numberOfLines = 1
        label.textColor = .white
        if Device.isIpad {
            label.font = .systemFont(ofSize: 80, weight: .black)
        } else {
            label.font = .systemFont(ofSize: 55, weight: .black)
        }
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let forLabel: UILabel = {
        let label = UILabel()
        label.text = "For true music fans"
        label.numberOfLines = 1
        label.textColor = .white
        if Device.isIpad {
            label.font = .systemFont(ofSize: 20, weight: .semibold)
        } else {
            label.font = .systemFont(ofSize: 15, weight: .semibold)
        }
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
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
        if Device.isIpad {
            label.font = .systemFont(ofSize: 18, weight: .regular)
        } else {
            label.font = .systemFont(ofSize: 14, weight: .regular)
        }
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var activateButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("ACTIVATE OFFER", for: .normal)
        if Device.isIpad {
            button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        } else {
            button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        }
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
    
    private var generalStackView = UIStackView()
    
    override init(frame: CGRect){
        super.init(frame:frame)
        setupViews()
        setConstraints()
        print(screenWidth)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func activateButtonTapped() {
        print("activateButtonTapped")
    }
    
    private func setupViews() {
        backgroundColor = .black
        
        timerStackView = UIStackView(arrangedSubviews: [daysView,colonLabel1,hoursView, colonLabel2,minutesView,colonLabel3,secondsView], axis: .horizontal, spacing: 5)
        
        if Device.isIpad {
            
            privacyButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            restoreButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            termsButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
            
            privacyStackView = UIStackView(arrangedSubviews: [privacyButton, restoreButton, termsButton], axis: .horizontal, spacing: 0)
            
            privacyStackView.distribution = .fillEqually
            privacyStackView.alignment = .center
            
            generalStackView = UIStackView(arrangedSubviews: [chanceLabel, percentageLabel, forLabel, timerStackView, descriptionLabel, activateButton, privacyStackView], axis: .vertical, spacing: 20)
            
            addSubview(generalStackView)
        } else {
            
            privacyStackView = UIStackView(arrangedSubviews: [privacyButton, restoreButton, termsButton], axis: .horizontal, spacing: 15)
            
            privacyStackView.distribution = .equalSpacing
            privacyStackView.alignment = .bottom
            
            addSubview(chanceLabel)
            addSubview(percentageLabel)
            addSubview(forLabel)
            addSubview(timerStackView)
            addSubview(descriptionLabel)
            addSubview(activateButton)
            addSubview(privacyStackView)
        }
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        
        if Device.isIpad {
            
            NSLayoutConstraint.activate([
                generalStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                generalStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
                generalStackView.trailingAnchor.constraint(greaterThanOrEqualTo: safeAreaLayoutGuide.trailingAnchor, constant: -95)
            ])
            
            NSLayoutConstraint.activate([
                timerStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.07)
            ])
            
            NSLayoutConstraint.activate([
                activateButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.11),
                activateButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.498)
            ])
            
        } else {
            
            NSLayoutConstraint.activate([
                chanceLabel.topAnchor.constraint(equalTo: topAnchor, constant: screenWidth * 0.013),
                chanceLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
            
            NSLayoutConstraint.activate([
                percentageLabel.topAnchor.constraint(equalTo: chanceLabel.bottomAnchor, constant: screenWidth * 0.03),
                percentageLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
            
            NSLayoutConstraint.activate([
                forLabel.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor, constant: screenWidth * 0.02),
                forLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
            
            NSLayoutConstraint.activate([
                timerStackView.topAnchor.constraint(equalTo: forLabel.bottomAnchor, constant: screenWidth * 0.05),
                timerStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                timerStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.105)
            ])
            
            NSLayoutConstraint.activate([
                descriptionLabel.topAnchor.constraint(equalTo: timerStackView.bottomAnchor, constant: screenWidth * 0.04),
                descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
            
            NSLayoutConstraint.activate([
                activateButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: screenWidth * 0.026),
                activateButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.16),
                activateButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.77),
                activateButton.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])
            
            NSLayoutConstraint.activate([
                privacyStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -screenWidth * 0.077),
                privacyStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
                privacyStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.004)
            ])
        }
    }
}
