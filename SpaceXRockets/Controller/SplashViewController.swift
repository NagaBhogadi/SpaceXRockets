//
//  SplashViewController.swift
//  SpaceXRockets
//
//  Created by Naga Rajitha Bhogadi on 5/29/26.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let listVC = storyboard.instantiateViewController(
                withIdentifier: "RocketListViewController"
            )
            
            let navController = UINavigationController(rootViewController: listVC)
            navController.modalPresentationStyle = .fullScreen
            
            self.present(navController, animated: true)
        }
    }
}
