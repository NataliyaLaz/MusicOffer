//
//  CustomAlert.swift
//  MusicOffer
//
//  Created by Nataliya Lazouskaya on 3.07.22.
//

import UIKit

class CustomAlert: UIView {

    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0//without TAMIK because we will use frames here in CustomAlert
        return view
    }()

    private let alertView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .specialDarkBlue
        view.layer.cornerRadius = 20
        return view
    }()

    private let scrollView = UIScrollView()

 //   private var mainView: UIView?
    private let setsTextField = UITextField()
    private let repsTextField = UITextField()

    func alertCustom(viewController: UIViewController, timer: Int) {
        
        guard let parentView = viewController.view else { return }
     //   mainView = parentView

        scrollView.frame = parentView.frame
        parentView.addSubview(scrollView)

        backgroundView.frame = parentView.frame
        scrollView.addSubview(backgroundView)

        alertView.frame = CGRect(x: 40,
                                 y: -420,
                                 width: parentView.frame.width / 2,
                                 height: 150)
        scrollView.addSubview(alertView)

        let greatLabel = UILabel(frame: CGRect(x: 100,
                                                 y: alertView.frame.height * 0.4,
                                                 width: alertView.frame.width - 250,
                                                 height: 25))
        greatLabel.text = "Great!"
        greatLabel.textAlignment = .center
        greatLabel.font = .systemFont(ofSize: 35, weight: .bold)
        greatLabel.textColor = .white
        greatLabel.addShadow()
        alertView.addSubview(greatLabel)
        
        let days = timer.convertIntoTime()[0]
        let hours = timer.convertIntoTime()[1]
        let minutes = timer.convertIntoTime()[2]
        let seconds = timer.convertIntoTime()[3]
        
        var timerStringPresentation: String
        
        if days != "00" {
            timerStringPresentation = "\(days) : \(hours) : \(minutes) : \(seconds)"
        } else if hours != "00" {
            timerStringPresentation = "\(hours) : \(minutes) : \(seconds)"
        } else {
            timerStringPresentation = "\(minutes) : \(seconds)"
        }
    
        let offerActivatedLabel = UILabel(text: "Offer activated at \(timerStringPresentation)")
        offerActivatedLabel.translatesAutoresizingMaskIntoConstraints = true
        offerActivatedLabel.frame = CGRect(x: 30,
                                 y: greatLabel.frame.maxY + 10,//lowest point of greatLabel + 10
                                 width: alertView.frame.width - 60,
                                 height: 20)
        alertView.addSubview(offerActivatedLabel)
        


        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = 0.5
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.alertView.center = parentView.center
                }
            }
        }
    }
}

