//
//  LeftView.swift
//  MusicOffer
//
//  Created by Nataliya Lazouskaya on 29.06.22.
//

import UIKit

class LeftView: UIView {
    
    class Device {
        static var isIpad : Bool { return UIDevice.current.userInterfaceIdiom == .pad }
    }
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .specialGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let iMusicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "music")
        if Device.isIpad {
            imageView.contentMode = .scaleAspectFill
        } else {
            imageView.contentMode = .scaleAspectFit
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect){
        super.init(frame:frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func closeButtonTapped() {
        
    }
    
    private func setupViews() {
        backgroundColor = .black
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(closeButton)
        addSubview(iMusicImageView)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            iMusicImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iMusicImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iMusicImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ])
    }
}
