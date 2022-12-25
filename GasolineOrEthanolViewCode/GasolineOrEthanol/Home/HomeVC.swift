//
//  HomeVC.swift
//  GasolineOrEthanol
//
//  Created by Anderson Sales on 21/12/22.
//

import UIKit

class HomeVC: UIViewController {
    
    // Creating a screen variable of type HomeScreen
    var screen: HomeScreen?
    
    // Instantiating the screen
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting a background color just for the sake of visualization
        view.backgroundColor = .systemTeal
        
        // Since we want to use the delegate here, we need to call it
        screen?.getAccessToDelegate(delegate: self)
    }
}

// MARK: Creating an extension to sign the protocol
extension HomeVC: HomeScreenDelegate {
    
    // Calling the function to conform to the protocol
    func startButtonTapped() {
        let vc = CalculatorVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

