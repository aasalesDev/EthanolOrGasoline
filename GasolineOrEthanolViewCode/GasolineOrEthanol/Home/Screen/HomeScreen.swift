//
//  HomeScreen.swift
//  GasolineOrEthanol
//
//  Created by Anderson Sales on 21/12/22.
//

import UIKit

// MARK: Creating a protocol for when the button is tapped

// Creating the protocol with a function
protocol HomeScreenDelegate: AnyObject {
    func startButtonTapped()
}

class HomeScreen: UIView {
    
    // Creating a variable to sign the protocol
    private weak var delegate: HomeScreenDelegate?
    
    // Creating a function to get access to the delegate (since it is private)
    public func getAccessToDelegate(delegate: HomeScreenDelegate?) {
        self.delegate = delegate
    }
    
    // MARK: You need to create the elements of the screen
    
    // Creating an imageView
    lazy var backgroundImageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG HOME")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // Creating the logoImageView
    lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    // Creating the start button
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: We need to create an action for the button
    
    // Creating the action for the button
    @objc func startButtonTapped() {
        // Calling the startButtonTapped function (from the protocol) when the button is tapped
        self.delegate?.startButtonTapped()
    }
    
    // As soon as a screen is created, you need to initialize it
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // MARK: Once an element is created, you need to add it to the screen/view
        
        // Adding elements to the screen/view
        addSubview(backgroundImageView)
        addSubview(logoAppImageView)
        addSubview(startButton)
        
        // MARK: Once constraints are created, you need to call them
        
        // Calling the method to setup constraints
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Once an element is added to the view, you need to set constraints to it
    
    // Creating a function to add constraints to the elements of the screen
    private func setupConstraints() {
        
        // Activating your constraints
        NSLayoutConstraint.activate([
            // Defining the constraints for the top, bottom, leading, and trailing anchor
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 150),
            
            startButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -125),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            startButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    
}
