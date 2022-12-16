//
//  LoginViewController.swift
//  RecipeSaverApp
//
//  Created by Иван Доронин on 07.12.2022.
//

import UIKit

final class LoginViewController: UIViewController {
    private var textFieldsSV = UIStackView()
    private var signInButton = UIButton()
    private var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        
        setupNavBar()
        setupImageView()
        setupTextFields()
        setupSignInButton()
    }
    
    private func setupSignInButton() {
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.setTitleColor(.black, for: .normal)
        signInButton.layer.cornerRadius = 12
        signInButton.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        signInButton.backgroundColor = .white
        signInButton.heightAnchor.constraint(equalTo: signInButton.widthAnchor).isActive = true
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        self.view.addSubview(signInButton)
        signInButton.setHeight(to: 48)
        signInButton.setWidth(to: self.view.frame.width)
        signInButton.pinTop(to: textFieldsSV.bottomAnchor)
        signInButton.pin(to: self.view, [.left: 24, .right:24])
    }
    
    @objc
    private func signInButtonPressed() {
        let mainViewController = MainViewController()
        navigationController?.pushViewController(mainViewController, animated: true)
    }
    
    private func setupImageView() {
        imageView = UIImageView(image: UIImage(named: "recipe"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        imageView.setHeight(to: self.view.frame.height)
    }
    
    private func getTextFields(isPass pass: Bool, placeholder placeh: String) -> UITextField {
        let textField = UITextField()
        if pass {
            textField.isSecureTextEntry = true
        }
        textField.borderStyle = .roundedRect
        textField.placeholder = placeh
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        textField.setWidth(to: self.view.frame.width)
        return textField
    }
    
    private func setupTextFields() {
        let email = getTextFields(isPass: false, placeholder: "email")
        let pass = getTextFields(isPass: true, placeholder: "password")
        
        textFieldsSV = UIStackView(arrangedSubviews: [email, pass])
        textFieldsSV.spacing = 12
        textFieldsSV.axis = .vertical
        textFieldsSV.distribution = .fillEqually
        self.view.addSubview(textFieldsSV)
        textFieldsSV.pinTop(to: self.view.safeAreaLayoutGuide.centerYAnchor)
        textFieldsSV.pin(to: self.view, [.left: 24, .right: 24])
    }
    
    private func setupNavBar() {
        navigationItem.titleView?.tintColor = .white
        navigationItem.title = "Log in"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
