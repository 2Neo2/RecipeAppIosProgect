//
//  RegistrationViewController.swift
//  RecipeSaverApp
//
//  Created by Иван Доронин on 07.12.2022.
//

import UIKit

final class RegistrationViewController: UIViewController {
    private var registerButton = UIButton()
    private var textFieldsSV = UIStackView()
    private var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemGray6
        
        setupNavBar()
        setupTextFields()
        setupImageView()
        setupRegistrationButton()
    }
    
    private func setupRegistrationButton() {
        registerButton.setTitle("Registration", for: .normal)
        registerButton.setTitleColor(.black, for: .normal)
        registerButton.layer.cornerRadius = 12
        registerButton.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        registerButton.backgroundColor = .white
        registerButton.heightAnchor.constraint(equalTo: registerButton.widthAnchor).isActive = true
        registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        self.view.addSubview(registerButton)
        registerButton.setHeight(to: 48)
        registerButton.pinTop(to: textFieldsSV.bottomAnchor)
        registerButton.pin(to: self.view, [.left: 24, .right: 24])
    }
    
    @objc
    private func registerButtonPressed() {
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
        let nickname = getTextFields(isPass: false, placeholder: "nickname")
        let email = getTextFields(isPass: false, placeholder: "email")
        let pass = getTextFields(isPass: true, placeholder: "password")
        let passRep = getTextFields(isPass: true, placeholder: "password again")
        let aboutYourseld = getTextFields(isPass: false, placeholder: "about yourself")
        
        textFieldsSV = UIStackView(arrangedSubviews: [nickname, email, pass, passRep])
        textFieldsSV.spacing = 12
        textFieldsSV.axis = .vertical
        textFieldsSV.distribution = .fillEqually
        self.view.addSubview(textFieldsSV)
        textFieldsSV.pinTop(to: self.view.safeAreaLayoutGuide.centerYAnchor)
        textFieldsSV.pin(to: self.view, [.left: 24, .right: 24])
    }
    
    private func setupNavBar() {
        navigationItem.title = "Registration"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem?.tintColor = .label
    }
    
    @objc
    private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
}
