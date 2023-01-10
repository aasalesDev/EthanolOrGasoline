//
//  Screen.swift
//  GasolineOrEthanol
//
//  Created by Anderson Sales on 24/12/22.
//

import UIKit

/// MARK: For the actions of buttons, let's create a protocol
protocol CalculatorScreenProtocol: AnyObject {
    func calculateButtonTapped()
    func backButtonTapped()
}

class CalculatorScreen: UIView {
    
    /// MARK: Creating a variable of protocol type
    private weak var delegate: CalculatorScreenProtocol?
    
    func getAccessToDelegate(delegate: CalculatorScreenProtocol?) {
        self.delegate = delegate
    }
    
    ///Creating the elements of the screen
    lazy var backgroundImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR DARK")
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
    
    lazy var ethanolPriceTextField: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço do Álcool"
        tf.textColor = .darkGray
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    lazy var gasPriceTextField: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço da Gasolina"
        tf.textColor = .darkGray
        tf.addDoneButtonOnKeyboard()
        return tf
    }()
    
    lazy var calculateButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = UIColor(red: 230/255, green: 0/255, blue: 127/255, alpha: 1.0)
        button.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func calculateButtonTapped() {
        /// When the back button is tapped, it shoots the method "calculateButtonTapped(),
        /// which can be called anywhere in the app. In our case, it will be called in the Calculator VC
        delegate?.calculateButtonTapped()
    }
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Back Button"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        //button.backgroundColor = .systemMint
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func backButtonTapped() {
        /// When the back button is tapped, it shoots the method "backButtonTapped(),
        /// which calls the method popViewController in the CalculatorVC
        delegate?.backButtonTapped()
    }
    
    /// Initiating the view where all subviews will be added
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /// Adding the created elements
        addSubview(backgroundImage)
        addSubview(logoAppImageView)
        addSubview(ethanolPriceTextField)
        addSubview(gasPriceTextField)
        addSubview(calculateButton)
        addSubview(backButton)
        
        /// Calling the method to configure all constraints
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Method to setup all constraints (array of constraints)
    private func configureConstraints() {
        
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            logoAppImageView.heightAnchor.constraint(equalToConstant: 150),
            
            ethanolPriceTextField.topAnchor.constraint(equalTo: logoAppImageView.bottomAnchor, constant: 150),
            ethanolPriceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ethanolPriceTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ethanolPriceTextField.heightAnchor.constraint(equalToConstant: 45),
            
            gasPriceTextField.topAnchor.constraint(equalTo: ethanolPriceTextField.bottomAnchor, constant: 20),
            gasPriceTextField.leadingAnchor.constraint(equalTo: ethanolPriceTextField.leadingAnchor),
            gasPriceTextField.trailingAnchor.constraint(equalTo: ethanolPriceTextField.trailingAnchor),
            gasPriceTextField.heightAnchor.constraint(equalTo: ethanolPriceTextField.heightAnchor),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculateButton.heightAnchor.constraint(equalToConstant: 40)
    
        ])
    }
    
}
