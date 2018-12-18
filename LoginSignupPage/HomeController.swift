//
//  HomeController.swift
//  LoginSignupPage
//
//  Created by Max Euler on 18.12.18.
//  Copyright © 2018 Max Euler. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    let isUserLoggedIn = false
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Application XY"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (!isUserLoggedIn) {
            DispatchQueue.main.async {
                self.handleLogout()
            }
        }
        
        setupViews()
    }
    
    @objc func handleLogout() {
        let loginController = LoginController()
        let navController = UINavigationController(rootViewController: loginController)
        present(navController, animated: true, completion: nil)
    }
    
    fileprivate func setupViews() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        navigationItem.rightBarButtonItem?.tintColor = .gray
        view.backgroundColor = .white
        
        view.addSubview(welcomeLabel)
        welcomeLabel.heightAnchor.constraint(equalToConstant: 300).isActive = true
        welcomeLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
