//
//  LeftView.swift
//  MusicOffer
//
//  Created by Nataliya Lazouskaya on 29.06.22.
//

import UIKit

class LeftView: UIView {
    
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
        imageView.contentMode = .scaleAspectFit
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
        backgroundColor = .blue
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
            iMusicImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8)
        ])
    }
}
