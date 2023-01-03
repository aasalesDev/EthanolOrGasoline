//
//  ResultScreen.swift
//  GasolineOrEthanol
//
//  Created by Anderson Sales on 25/12/22.
//

import UIKit

protocol ResultScreenProtocol: AnyObject {
    func resultBackButtonTapped()
    func resultRecalculateButtonTapped()
}

class ResultScreen: UIView {
    
    private var delegate: ResultScreenProtocol?
    
    func getAccessToDelegate(delegate: ResultScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var backgroundImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var logoAppImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO menor")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var sentenceLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.text = "Abasteça com"
        return label
    }()
    
    lazy var resultLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 72)
        label.textAlignment = .center
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        //button.backgroundColor = .systemMint
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Back Button"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var recalculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular Novamente", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(recalculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc private func backButtonTapped() {
        // When the back button is tapped, it shoots the method "backButtonTapped(),
        // which calls the method popViewController in the ResultVC
        delegate?.resultBackButtonTapped()
    }
    
    @objc private func recalculateButtonTapped() {
        // Calling the protocol method to be shot
        delegate?.resultRecalculateButtonTapped()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Adding the element to the screen
        addSubview(backgroundImageView)
        addSubview(logoAppImageView)
        addSubview(backButton)
        addSubview(sentenceLabel)
        addSubview(resultLabel)
        addSubview(recalculateButton)
        
        // Calling the method to setup contraints
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            //Constraints so that the image view will cover the entire screen
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //Constraints for the back button
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            //Constraints for the logo image view
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 150),
            
            sentenceLabel.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 120),
            sentenceLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            resultLabel.topAnchor.constraint(equalTo: sentenceLabel.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            recalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            recalculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            recalculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            recalculateButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
