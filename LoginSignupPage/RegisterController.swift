//
//  RegisterController.swift
//  LoginSignupPage
//
//  Created by Max Euler on 18.12.18.
//  Copyright © 2018 Max Euler. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Register"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = .lightGray
        return label
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.tintColor = .lightGray
        textField.addTarget(self, action: #selector(handleInputChange), for: .editingChanged)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.tintColor = .lightGray
        textField.addTarget(self, action: #selector(handleInputChange), for: .editingChanged)
        return textField
    }()
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(white: 0, alpha: 0.03)
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.tintColor = .lightGray
        textField.addTarget(self, action: #selector(handleInputChange), for: .editingChanged)
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    let alreadyHaveAnAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Already have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleAlreadyHaveAnAccount), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // check the state of the textfield and enable or disable register button
    @objc func handleInputChange() {
        let isFormValid = emailTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0 && confirmPasswordTextField.text?.count ?? 0 > 0
        
        if (isFormValid) {
            registerButton.isEnabled = true
            registerButton.backgroundColor = .gray
        } else {
            registerButton.isEnabled = false
            registerButton.backgroundColor = .lightGray
        }
    }
    
    @objc func handleRegister() {
        // TODO save user data to database and log user in
        self.dismiss(animated: true, completion: nil)
    }
    
    // show login view
    @objc func handleAlreadyHaveAnAccount() {
        navigationController?.popViewController(animated: true)
    }
    
    // Add all UI elements to the view and set the contraints
    fileprivate func setupViews() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 150)
        
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, confirmPasswordTextField, registerButton])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        stackView.heightAnchor.constraint(equalToConstant: 260).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        view.addSubview(alreadyHaveAnAccountButton)
        alreadyHaveAnAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 10, paddingRight: 20, width: 0, height: 40)
    }
}
