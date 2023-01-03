//
//  ResultVC.swift
//  GasolineOrEthanol
//
//  Created by Anderson Sales on 25/12/22.
//

import UIKit

enum BestFuel: String {
    case gas = "Gasolina"
    case ethanol = "Álcool"
}

class ResultVC: UIViewController {
    
    private var screen: ResultScreen?
    private let bestFuel: BestFuel
    
    // Initializer to receive the best fuel information when the controller is instantiated
    init(bestFuel: BestFuel) {
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.getAccessToDelegate(delegate: self)
        //Assigning the best fuel to the result label
        screen?.resultLabel.text = bestFuel.rawValue
    }
}

extension ResultVC: ResultScreenProtocol {
    func resultRecalculateButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func resultBackButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
