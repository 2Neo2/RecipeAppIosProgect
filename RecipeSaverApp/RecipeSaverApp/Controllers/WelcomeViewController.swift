//
//  WelcomeViewController.swift
//  RecipeSaverApp
//
//  Created by Иван Доронин on 07.12.2022.
//

import UIKit

final class WelcomeViewController: UIViewController {
    private var buttonsSV = UIStackView()
    private var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        
        setupImageView()
        setupButtons()
    }
    
    private func setupImageView() {
        imageView = UIImageView(image: UIImage(named: "recipe"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        self.view.addSubview(imageView)
        imageView.setHeight(to: self.view.frame.height)
    }
    
    private func getButton(title value: String) -> UIButton {
        let button = UIButton()
        button.setTitle(value, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        button.setHeight(to: 48)
        return button
    }
    
    private func setupButtons() {
        let loginButton = getButton(title: "Login")
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        let registrationButton = getButton(title: "Registration")
        registrationButton.addTarget(self, action: #selector(registrationButtonPressed), for: .touchUpInside)
        
        buttonsSV = UIStackView(arrangedSubviews: [loginButton, registrationButton])
        buttonsSV.spacing = 12
        buttonsSV.axis = .vertical
        buttonsSV.distribution = .fillEqually
        self.view.addSubview(buttonsSV)
        buttonsSV.pinBottom(to: self.view.safeAreaLayoutGuide.bottomAnchor)
        buttonsSV.pin(to: self.view, [.left:24, .right:24, .bottom: 150])
    }
    
    @objc
    private func loginButtonPressed() {
        let loginController = LoginViewController()
        navigationController?.pushViewController(loginController, animated: true)
    }
    
    @objc
    private func registrationButtonPressed() {
        let regViewController = RegistrationViewController()
        navigationController?.pushViewController(regViewController, animated: true)
    }
}
