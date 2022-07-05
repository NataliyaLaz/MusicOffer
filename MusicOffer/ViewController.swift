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
    
    let customAlert = CustomAlert()
    
    var timeRemaining = 86400
    weak var timer: Timer?
    
    let defaults = UserDefaults.standard
    let timeRemainingID = "timer"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(timeRemaining, forKey: timeRemainingID)
        
        setupViews()
        setConstraints()
        setDelegates()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(appDidEnterBackground),
                                               name:UIApplication.didEnterBackgroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self,selector: #selector(appDidEnterForeground), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        rightView.activateButton.applyGradient(colors: [UIColor.specialBlue.cgColor, UIColor.specialPink.cgColor])
        rightView.activateButton.dropShadow()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer?.invalidate()
    }
    
    @objc func appDidEnterBackground() {
        UserDefaults.standard.set(timeRemaining, forKey: timeRemainingID)
        timer?.invalidate()
    }
    
    @objc func appDidEnterForeground() {
        timeRemaining = defaults.integer(forKey: timeRemainingID)
        
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
        }
    }
    
    @objc func step() {
        if timeRemaining > 0 {
            timeRemaining -= 1
        } else {
            timer?.invalidate()
        }
        rightView.secondsView.timerLabel.alpha = 1
        
        UIView.animate(withDuration: 1, animations: {
            
            self.rightView.secondsView.timerLabel.text = self.timeRemaining.convertIntoTime()[3]
            self.rightView.secondsView.timerLabel.alpha = 0
        }, completion: { (true) in
            
        })
        rightView.daysView.timerLabel.text = timeRemaining.convertIntoTime()[0]
        rightView.hoursView.timerLabel.text = timeRemaining.convertIntoTime()[1]
        rightView.minutesView.timerLabel.text = timeRemaining.convertIntoTime()[2]
        // rightView.secondsView.timerLabel.text = timeRemaining.convertIntoTime()[3]
    }
    
    private func setupViews() {
        view.backgroundColor = .black
        
        mainStackView = UIStackView(arrangedSubviews: [leftView, rightView],
                                    axis: .horizontal,
                                    spacing: 0)
        mainStackView.distribution = .fillEqually
        view.addSubview(mainStackView)
    }
    
    private func setDelegates() {
        rightView.activateDelegate = self
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

//MARK: - ActivateProtocol

extension ViewController: ActivateProtocol{
    
    func activateButtonTapped() {
        
        customAlert.alertCustom(viewController: self, timer: timeRemaining)
        timer?.invalidate()
    }
}

