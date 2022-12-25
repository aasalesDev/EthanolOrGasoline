//
//  ResultVC.swift
//  GasolineOrEthanol
//
//  Created by Anderson Sales on 25/12/22.
//

import UIKit

class ResultVC: UIViewController {
    
    private var screen: ResultScreen?
    // Receiving the result from the calculation screen
    var result: String?
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.getAccessToDelegate(delegate: self)
        //Assigning the result to the result label
        screen?.resultLabel.text = "\(screen?.resultLabel.text ?? "") \(result ?? "")"
    }
}

extension ResultVC: ResultScreenProtocol {
    func resultBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
