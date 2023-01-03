//
//  CalculatorVC.swift
//  GasolineOrEthanol
//
//  Created by Anderson Sales on 24/12/22.
//

import UIKit

class CalculatorVC: UIViewController {
    
    // Creating a variable of type CalculatorScreen (it can be used to access the protocol, for example)
    var screen: CalculatorScreen?
    
    // Creating a variable of type Alert so that this class can show alerts
    var alert: Alert?
    
    override func loadView() {
        // Creating an instance of CalculatorScreen and assigning it to the view
        screen = CalculatorScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // We need to sign the protocol so that we can use it here in the CalculatorVC class
        screen?.getAccessToDelegate(delegate: self)
        // We need to instantiate the alert in the viewDidLoad
        alert = Alert(controller: self)
        configTextFields()
        configTapGesture()
    }
    
    private func configTextFields() {
        screen?.gasPriceTextField.delegate = self
        screen?.ethanolPriceTextField.delegate = self
    }
    
    // Creating a function to validate whether the textfields have values for the calculation to be performed
    func validateTextFields() -> Bool {
        guard let ethanolPrice = screen?.ethanolPriceTextField.text else { return false }
        guard let gasPrice = screen?.gasPriceTextField.text else { return false }
        
        if ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlert(title: "Atenção!", message: "Informe os valores de álcool e gasolina.")
        } else if ethanolPrice.isEmpty {
            alert?.showAlert(title: "Atenção!", message: "Informe a valor do álcool.")
        } else if gasPrice.isEmpty {
            alert?.showAlert(title: "Atenção!", message: "Informe o valor da gasolina.")
        }
        return true
    }
}

extension CalculatorVC: CalculatorScreenProtocol {
    func calculateButtonTapped() {
        
        if validateTextFields(){
            
            // Creating the logic to calculate which option is best based on their prices (ethanol or gasoline)
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            
            let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.00") as? Double) ?? 0.00
            let gasPrice: Double = (formatter.number(from: screen?.gasPriceTextField.text ?? "0.00") as? Double) ?? 0.00
            
            // Created a variable of type ResultVC
            var vc: ResultVC?
            
            if ethanolPrice >= gasPrice * 0.7 {
                //Initializing vc with the best fuel based on calculation
                vc = ResultVC(bestFuel: .gas)
            } else {
                //Initializing vc with the best fuel based on calculation
                vc = ResultVC(bestFuel: .ethanol)
            }
            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
    }
    
    internal func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func configTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
}

extension CalculatorVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
